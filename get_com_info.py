from RPA.Desktop.OperatingSystem import OperatingSystem

def get_computer_information():
    ops = OperatingSystem()
    print(f"Boot time    : { ops.get_boot_time(as_datetime=True) }"
          f"Machine name : { ops.get_machine_name() }"
          f"Username     : { ops.get_username() }"
          f"Memory       : { ops.get_memory_stats() }")

if __name__ == "__main__":
    get_computer_information()