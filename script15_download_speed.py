  
  
def transfer_time(file_size, unit, ethernet_speed = 10):
    if unit == "KiB":
        file_size = file_size * 1024
        
    elif unit == "MiB":
        file_size = file_size * 1024 ** 2
        
    elif unit == "GiB":
        file_size = file_size * 1024 ** 3 
        
    file_size_bits = file_size * 8
    return file_size_bits / (ethernet_speed * 1e6)



print(transfer_time(80, "KiB", 1000))

