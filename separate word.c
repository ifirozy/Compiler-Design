#include <stdio.h>

int main()
{
    FILE *in_ptr;
    FILE *out_ptr;
    char c, last = ' ';

    in_ptr = fopen("input.txt", "r");
    out_ptr = fopen("output.txt", "w");

    if(in_ptr == NULL || out_ptr == NULL)
    {
      printf("Error!");
    }

    else
    {
        while(fscanf(in_ptr, "%c", &c)==1)
        {
            if(last!=' '&& last!= '\n' && last!= '\t')
            {
                if(c!=' '&& c!= '\n' && c!= '\t')
                {
                    fprintf(out_ptr, "%c", c);
                }
                else
                {
                    fprintf(out_ptr, "\n");
                }

            }
            else
            {
                if(c!=' '&& c!= '\n' && c!= '\t')
                {
                    fprintf(out_ptr, "%c", c);
                }
                else
                {
                    continue;
                }
            }

            last = c;
        }

    }
    fclose(in_ptr);
    fclose(out_ptr);

    return 0;
}
