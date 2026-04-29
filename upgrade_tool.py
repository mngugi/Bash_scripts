import subprocess
import logging

logging.basicConfig(filename="fedora_updater.log", level=logging.INFO)

def run(cmd):
    try:
        logging.info(f"Running: {cmd}")
        subprocess.run(cmd, shell=True, check=True)
    except subprocess.CalledProcessError as e:
        logging.error(f"Error: {e}")
        exit(1)

def precheck():
    run("df -h /")
    run("ping -c 2 8.8.8.8")

def update():
    run("sudo dnf upgrade --refresh -y")

def install_plugin():
    run("sudo dnf install dnf-plugin-system-upgrade -y")

def download():
    run("sudo dnf system-upgrade download --releasever=44 --allowerasing")

def upgrade():
    run("sudo dnf system-upgrade reboot")

if __name__ == "__main__":
    print("[+] Fedora Upgrade Tool")
    precheck()
    update()
    install_plugin()
    download()
    upgrade()
