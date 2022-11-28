#include <stdio.h>
#include <mrfp.h>

int main(int argc, char **argv)
{
    if(argc < 2) {
        printf("%s - Usage %s <file>\n", argv[0], argv[0]);
        return 1;
    }
	mrfp_resource_t resource = mrfp_resource_file_open(argv[1]);
	
    if(resource == NULL) {
        fprintf(stderr, "Error opening file %s\n", argv[1]);
        return -1;
    }

    printf("Data offset: 0x%X\n", mrfp_data_offset(resource));
	printf("Data Size: 0x%X Bytes\n", mrfp_data_size(resource));
    printf("Map offset: 0x%X\n", mrfp_map_offset(resource));
	printf("Map Size: 0x%X Bytes\n", mrfp_map_size(resource));

    return 0;

}
