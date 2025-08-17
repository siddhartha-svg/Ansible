#!/bin/bash

# Define paths and variables
JDK_8_VERSION="jdk1.8.0_421"
JDK_17_VERSION="jdk-17.0.12"
JDK_8_TAR="jdk-8u421-linux-x64.tar.gz"
JDK_17_TAR="jdk-17.0.12_linux-x64_bin.tar.gz"
JDK_8_URL="https://oneartifactoryci.horizon.com/artifactory/RBMV_AWS/SOFTWARE/JDK/${JDK_8_TAR}"
JDK_17_URL="https://oneartifactoryci.horizon.com/artifactory/RBMV_AWS/SOFTWARE/JDK/${JDK_17_TAR}"
INSTALL_PATH="/opt/app"
USER="madmin"
GROUP="madmin"
CREDENTIALS="madmin:your-secret-token"

# --- Install and manage JDK 8 ---

echo "Installing JDK 8..."
# Clean up old JDK 8 installation
rm -rf "${INSTALL_PATH}/${JDK_8_VERSION}"
unlink "${INSTALL_PATH}/jdk-8"

# Download and install JDK 8
curl -u "${CREDENTIALS}" -O "${JDK_8_URL}"
tar -xvzf "${JDK_8_TAR}" -C "${INSTALL_PATH}"
rm -f "${JDK_8_TAR}"

# Set permissions and create symlink for JDK 8
chown -R "${USER}:${GROUP}" "${INSTALL_PATH}/${JDK_8_VERSION}"
ln -s "${INSTALL_PATH}/${JDK_8_VERSION}" "${INSTALL_PATH}/jdk-8"

# --- Install and manage JDK 17 ---

echo "Installing JDK 17..."
# Clean up old JDK 17 installation
rm -rf "${INSTALL_PATH}/${JDK_17_VERSION}"
unlink "${INSTALL_PATH}/jdk-17"

# Download and install JDK 17
curl -u "${CREDENTIALS}" -O "${JDK_17_URL}"
tar -xvzf "${JDK_17_TAR}" -C "${INSTALL_PATH}"
rm -f "${JDK_17_TAR}"

# Set permissions and create symlink for JDK 17
chown -R "${USER}:${GROUP}" "${INSTALL_PATH}/${JDK_17_VERSION}"
ln -s "${INSTALL_PATH}/${JDK_17_VERSION}" "${INSTALL_PATH}/jdk-17"

# --- Verify installation ---

echo "Verifying installations:"
ls -lrt "${INSTALL_PATH}"
