
Based on the Jenkins configuration screenshots, here is a comprehensive end-to-end guide formatted for a GitHub `README.md` file. I've generalized all company-specific and user-sensitive information to make the guide universally applicable.

### **Jenkins Job: Node.js Upgrade Automation**

This document describes the end-to-end configuration of a Jenkins job designed to automate the process of upgrading Node.js on a set of target servers. The job is parameterized, secure, and uses a shell script to perform the upgrade.

***

### **1. General and Security Configuration**

The job's general settings define its purpose, security, and build environment.

* **Description**: "NodeJS Upgrade." This job is a simple automation tool.
* **Security**: The job uses **Project-based security**, inheriting permissions from its parent in the Jenkins folder hierarchy. Access is granted to specific users and groups to control who can build, configure, and manage the job.
* **Node Restriction**: The job is configured to run on a specific agent node with the label **`EY2V_Release_Delivery_AWS_VCG2`**. This ensures the job executes on a designated machine that has the necessary tools and network access for the task.
* **JDK**: The job explicitly uses the JDK configured as **`(System)`**, indicating it relies on the default JDK installed on the agent node.

---

### **2. Job Parameterization**

The job is parameterized to make it a reusable and flexible tool. Users can specify key information at runtime without modifying the job's code.

* **Server IPs (`ServerIP`)**: A **String Parameter** that accepts a comma-separated list of server IP addresses. The description guides the user on the required format.
* **Node.js Version (`NodeVersion`)**: A **String Parameter** that allows the user to specify the desired Node.js version to install. The description prompts the user to verify the default format.

---

### **3. Source Code Management (SCM)**

This job is configured to use **Git**, which connects to a repository to pull the build script and other necessary files. It uses a specific credential to authenticate with the repository, ensuring secure access. The job is not triggered automatically by SCM polling or webhooks; instead, it is designed for manual execution or through other CI/CD pipelines.

---

### **4. Build Steps**

The core logic of the job is contained within a shell script that is executed in the build step.

* **Script Type**: The job uses an **Execute shell** build step.
* **Script Logic**: The shell script performs the following tasks:
    1.  It creates a file named `userInput.properties`.
    2.  It takes the value of the `ServerIP` parameter and writes it to the `userInput.properties` file in the format `ServerIP=<list_of_ips>`.
    3.  It then prints the content of the `userInput.properties` file to the console for verification.

This approach suggests that the actual upgrade logic is likely contained in another script or a series of commands that use the generated properties file. For example, a subsequent step could read this file to determine which servers to connect to and what version of Node.js to install.

---

### **Summary**

This Jenkins job serves as a powerful example of how to create a simple, yet robust, automation workflow for system maintenance. It combines several key Jenkins features:

* **Parameterization** for user-driven input.
* **Node Restriction** for security and environment control.
* **Project-based Security** for granular access management.
* **Shell Scripting** for executing the core automation logic.

By configuring the job this way, a team can provide a safe and controlled way for authorized users to perform a common and critical task like a Node.js upgrade across multiple servers with a single click.

Everything Added here : https://github.com/siddhartha-svg/Ansible/blob/main/Playbooks/nodejs.yml

