*** Settings ***
Metadata          Metadata_test    RPA_Test    # Example of metadata
Library           RPA.Desktop.OperatingSystem
Library           Process
Library           RPA.Desktop



*** Tasks ***
Run Python Script
    Open application    notepad.exe
    ${result}=    Run Process    python    get_com_info.py
    Log    ${result.stdout}

Get Computer Informations
    #${boot_time}= Get Boot Time as_datetime=${TRUE}
    ${machine}=    Get Machine Name
    ${username}=    Get Username
    &{memory}=    Get Memory Stats
    Log Many    ${memory}
