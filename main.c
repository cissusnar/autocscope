#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <errno.h>
#include "config.h"

int is_cscope_path(char * in_path)
{
	char path[PATH_MAX];
	size_t len = strlen((const char *)in_path);
	strcpy(path,(const char *)in_path);
	strcpy(path + len,"/cscope.out");
	struct stat fst;
	if(!stat(path,&fst))
	{
		return 1;			
	}
	if (errno == ENOENT)
	{
		return 0;
	}
}

int build_cscope(char * in_path)
{
    chdir(in_path);
    system("find `pwd` -type f -name \"*.h\" -o -type f -name \"*.c\" -o -type f -name \"*.cpp\" > cscope.files");
    return system("cscope -bq > /dev/null");
}

int main(int argc, char * argv[])
{
    char workdir[PATH_MAX];
    getcwd(workdir, sizeof(workdir) - 1);

	char path[PATH_MAX];
	while(1)
	{
		getcwd(path,sizeof(path)-1);
		if(is_cscope_path(path))// && strcmp(path,workdir))
		{
			printf("%s",path);
			return build_cscope(path);;
		}
		chdir("..");
		if(!strcmp(path,PATH_SIGN))
		{
			break;
		}
	}
    if (argc > 1 && !strcmp(argv[1],"-b"))
      build_cscope(workdir); 
	else
	  fprintf(stderr, "");
	return 0;
}

