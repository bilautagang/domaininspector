DomainInspector is a simple and efficient bash script designed to check the live status of domains. The script reads a list of domains from an input file, verifies their availability using curl, and logs the live domains to an output file. It supports parallel processing to quickly handle large lists of domains.

**Features-**
    Input and Output Handling: Specify an input file containing domains and an optional output file for live domains.
    Live Domain Checking: Uses curl to check if each domain is live.
    Parallel Processing: Utilizes xargs for parallel domain checks, enhancing performance.
    Logging: Provides feedback on both live and non-live domains during execution.

**Usage**

        1. Clone the repository:
                git clone https://github.com/bilautagang/domaininspector.git
                cd domaininspector

        2. Make the script executable:
                chmod +x domaininspector.sh

        3. Run the script:
                ./domaininspector.sh <input_file> [output_file]

        <input_file>: Path to the file containing the list of domains to check.
        [output_file] (optional): Path to the file where live domains will be saved. Defaults to live_domains.txt.

**Example**
       ./domaininspector.sh domains.txt live_domains_output.txt
