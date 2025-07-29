#!/usr/bin/env python3

import json
import os
import xml.etree.ElementTree as ET

LMO_MANIFEST_FILE = 'manifest/snippets/lmodroid.xml'
BRANCH_TO_PICK = "sixteen-qpr0"

def get_repos_path():
    tree = ET.parse(LMO_MANIFEST_FILE)
    root = tree.getroot()
    return [project.get('name') for project in root.findall('project')]

def run_gerrit_query(repo: str):
    cmd = f"ssh -p 29418 Dhina17@gerrit.libremobileos.com gerrit query 'project:{repo} branch:{BRANCH_TO_PICK}' --no-limit --format JSON"
    result = os.popen(cmd).read()
    return [json.loads(line) for line in result.strip().splitlines() if line.strip()]

def generate_picklist():
    repos = get_repos_path()
    output_txt = ""
    for repo in repos:
        output_txt += "\n# " + repo + "\n"
        print(f"- {repo}")
        changes = []
        result = run_gerrit_query(repo)
        for item in result:
            if item.get("type") == "stats":
                continue
            changes.append(item['number'])
        changes.sort()
        for change in changes:
            output_txt += f"repopick {change}\n"
    with open("pick_lmo.sh", "w") as f:
        f.write(output_txt)
    print("Picklist generated in pick_lmo.sh")

def main():
    generate_picklist()

if __name__ == "__main__":
    main()