#!/usr/bin/env python3

import os
import sys
import xml.etree.ElementTree as ET

LMO_MANIFEST_FILE = 'manifest/snippets/lmodroid.xml'
PREVIOUS_BRANCH = "fifteen-qpr2"
NEW_BRANCH = "sixteen-qpr0"
TAG_TO_REBASE = 'android-16.0.0_r1'

NON_AOSP_REPOS = [
    "device/lmodroid/atv",
    "device/lmodroid/sepolicy",
    "external/exfatprogs",
    "external/libremobileos-fonts/AlbertSans",
    "external/libremobileos-fonts/Vazirmatn",
    "external/svox",
    "external/tigervnc",
    "external/yifan",
    "frameworks/base", # It's AOSP but sure it will fail, so don't waste time.
    "frameworks/lmodroid",
    "hardware/lmodroid",
    "manifest",
    "packages/apps/Aperture",
    "packages/apps/Backgrounds",
    "packages/apps/DesktopMode",
    "packages/apps/Etar",
    "packages/apps/F-DroidPrivilegedExtension",
    "packages/apps/FaceUnlock",
    "packages/apps/FMRadio",
    "packages/apps/FlipFlap",
    "packages/apps/GameSpace",
    "packages/apps/Glimpse",
    "packages/apps/LMODynamicWallpaper",
    "packages/apps/LMOFreeform",
    "packages/apps/LMOSettings",
    "packages/apps/LMOSystemUI",
    "packages/apps/LMOSystemUIClock",
    "packages/apps/Launcher3", # It's AOSP but sure it will fail, so don't waste time.
    "packages/apps/OpenEUICC",
    "packages/apps/ParallelSpace",
    "packages/apps/Recorder",
    "packages/apps/Ripple",
    "packages/apps/Settings", # It's AOSP but sure it will fail, so don't waste time.
    "packages/apps/SetupWizard"
    "packages/apps/TouchGestures",
    "packages/apps/Updater",
    "packages/modules/microG",
    "packages/overlays/LMODroid",
    "packages/resources/devicesettings",
    "packages/services/LMOStats",
    "packages/services/VncFlinger",
    "prebuilts/kernel-build-tools", # It's AOSP but we track it from specific tag.
    "prebuilts/lmodroid",
    "vendor/lmodroid",
    "vendor/support"
]

GREEN = '\033[92m'
RED = '\033[91m'
YELLOW = '\033[93m'
CYAN = '\033[96m'
BLUE = '\033[94m'
RESET = '\033[0m'

HEAD = 0
SUCCESS = 1
FAILED = 2
INFO = 3
WARN = 4

def prints(status, message):
    if status == HEAD:
        print(f"{CYAN}📦 {message}{RESET}\n")
    elif status == SUCCESS:
        print(f"   {GREEN}✅ {message}{RESET}\n")
    elif status == FAILED:
        print(f"   {RED}❌ {message}{RESET}\n")
    elif status == INFO:
        print(f"{BLUE}🔄 {message}{RESET}\n")
    elif status == WARN:
        print(f"   {YELLOW}⚠️ {message}{RESET}\n")

def get_repos_path():
    tree = ET.parse(LMO_MANIFEST_FILE)
    root = tree.getroot()
    return [project.get('path') for project in root.findall('project')]

def run_cmd(command: str) -> int:
    return os.system(command)

def set_aosp_remote(repo: str) -> None:
    # Remove existing aosp remote if it exists
    run_cmd("git remote rm aosp 2> /dev/null")
    remote_url = f"https://android.googlesource.com/platform/{repo}"
    if (repo == "kernel/configs"):
        remote_url = "https://android.googlesource.com/kernel/configs"
    elif (repo == "build/make"):
        remote_url = "https://android.googlesource.com/platform/build"
    run_cmd(f"git remote add aosp {remote_url}")

def set_lmo_remote() -> None:
    # Remove existing lmogerrit remote if it exists
    run_cmd("git remote rm lmogerrit 2> /dev/null")

    # Try to get project name from different remotes
    remote = os.popen("git config --get remote.lmodroid.projectname").read().strip()
    lmo_user = os.popen("git config --get review.gerrit.libremobileos.com.username").read().strip()
    if not lmo_user:
        prints(FAILED, "LMO user not set. Please set it using 'git config review.gerrit.libremobileos.com.username <username>'")
        sys.exit(1)
    else:
        remote_url = f"ssh://{lmo_user}@gerrit.libremobileos.com:29418/{remote}"
        run_cmd(f"git remote add lmogerrit {remote_url}")

def rebase():
    if not os.path.exists(LMO_MANIFEST_FILE):
        prints(FAILED, f"Manifest file {LMO_MANIFEST_FILE} does not exist. Make sure you run this from the root of the LMODroid source")
        return

    prints(INFO, "Rebasing all repos from the manifest...")
    ## Get the list of repositories path
    repos = get_repos_path()
    failed_repos = []
    root = os.getcwd()
    for repo in repos:
        prints(HEAD, f"{repo}")

        if repo in NON_AOSP_REPOS:
            prints(WARN, f"Skipping non-AOSP/non-preferred repository!")
            continue

        if not os.path.exists(repo):
            prints(WARN, f"Repository path does not exist!")
            failed_repos.append(repo)
            continue
        
        os.chdir(repo)
        
        # Add remotes
        set_lmo_remote()
        set_aosp_remote(repo)
        
        # Checkout previous branch
        fetch_cmd = f"git fetch lmogerrit {PREVIOUS_BRANCH} --quiet 2> /dev/null"
        if run_cmd(fetch_cmd) != 0:
            prints(FAILED, f"Fetch lmodroid branch failed.")
            failed_repos.append(repo)
            os.chdir(root)
            continue
        run_cmd("git checkout FETCH_HEAD --quiet 2> /dev/null")
        
        # Fetch tags from AOSP
        fetch_tag_cmd = "git fetch aosp --tags --quiet 2> /dev/null"
        if run_cmd(fetch_tag_cmd) != 0:
            prints(FAILED, f"Fetch tags failed.")
            failed_repos.append(repo)
            os.chdir(root)
            continue

        # Rebase onto the specified tag
        rebase_command = f"git rebase {TAG_TO_REBASE} --quiet 2> /dev/null"
        if run_cmd(rebase_command) != 0:
            prints(FAILED, f"Rebase failed")
            failed_repos.append(repo)
            os.chdir(root)
            continue
        
        # Push to LMO Gerrit
        push_command = "git push lmogerrit HEAD:refs/for/" + NEW_BRANCH + " --quiet 2> /dev/null"
        if run_cmd(push_command) != 0:
            prints(FAILED, "Push failed")
            failed_repos.append(repo)
            os.chdir(root)
            continue

        prints(SUCCESS, f"Successfully rebased and pushed")
        os.chdir(root)

    if failed_repos:
        prints(INFO, "The following repositories failed:")
        for failed_repo in failed_repos:
            print(f" - {failed_repo}")


def main():
    rebase()

if __name__ == "__main__":
    main()
