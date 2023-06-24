def hex_to_coe(hex_file, coe_file, element_length):
    with open(hex_file, 'r') as f_hex, open(coe_file, 'w') as f_coe:
        # Write COE file header
        f_coe.write("memory_initialization_radix=16;\n")
        f_coe.write("memory_initialization_vector=\n")
        
        # Process each line in the HEX file
        for line in f_hex:
            # Skip empty lines and lines that don't start with a colon (:)
            if line.strip() == '' or line[0] != ':':
                continue

            # Extract relevant information from the HEX line
            byte_count = int(line[1:3], 16)
            address = int(line[3:7], 16)
            record_type = int(line[7:9], 16)
            data = line[9:-2]

            # Only process data records (record type = 0x00)
            if record_type == 0x00:
                # Split the data into 2-character chunks
                data_chunks = [data[i:i+2] for i in range(0, len(data), 2)]

                # Write the data to the COE file with the specified element length
                for chunk in data_chunks:
                    f_coe.write(chunk.zfill(element_length) + "\n")

        # Write the closing line in the COE file
        f_coe.write(";")

# Usage example
hex_file_path = 'input.hex'
coe_file_path = 'output.coe'
element_length = 8  # Specify the desired element length in characters
hex_to_coe(hex_file_path, coe_file_path, element_length)
