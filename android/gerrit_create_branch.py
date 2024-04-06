import os
import xml.etree.ElementTree as ET

def createRepos():
    tree = ET.parse('lmodroid.xml')
    root = tree.getroot()
    for project in root.findall('project'):
        name = project.get('name')
        revision = project.get('revision')
        print("project = ", name , "| revision = ", revision)
        print("Creating branch...")
        cmd = "ssh -p 29418 Dhina17@gerrit.libremobileos.com gerrit create-branch " + name + " fourteen-qpr1 " + revision
        #print(cmd)
        os.system(cmd)

def main():
    createRepos()

if __name__ == "__main__": 
    main() 
