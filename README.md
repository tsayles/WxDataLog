# WxDataLog

A project to fetch temperature and AQI data from specific hardcoded Weather Underground URLs and log the data to a daily CSV file.

## Overview

This script uses the `lynx` command-line web browser to fetch temperature and AQI data from Weather Underground. The data is then logged to a daily CSV file every 15 minutes. If the CSV file for the day doesn't exist, the script will create it and add appropriate headers. The fetched data is also output to the console.

## Prerequisites

- `lynx`: A command-line web browser.
- Docker (optional): If you want to run the script inside a Docker container.

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/tsayles/WxDataLog.git
   cd WxDataLog
   ```

2. Run the script directly:
   ```bash
   bash Log_Temp_and_AQI.sh
   ```

   OR

   Build and run with Docker:

   ```bash
   docker build -t wxdatalog .
   docker run wxdatalog
   ```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the GNU General Public License. See the [LICENSE](LICENSE) file for details.

---

You can save the above content to a file named `README.md` in your project directory. This provides a basic overview of the project, instructions for getting started, and some other standard README sections. Adjust as needed for your specific project details and requirements!
