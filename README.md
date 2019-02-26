# dirtree (temporary name, will be changed)
An file system traversing utility. Backtracks in the directory structure. Got inspiration from xpath/2.

``` prolog
?- directory_files('.',List).
List=[file1.txt,file2.txt,file3.pl].
```

``` prolog
?- exists_file('file1.txt'). %old way
true.
```

``` prolog
?- file('file1.txt'). %the new way
true.
```

``` prolog
?- file(A).
A='file1.txt';
A='file2.txt';
A='file3.pl'
```

``` prolog
?- filetype(F.pl). %Swipl doesn't like  the dot in 'F.pl' and the Do What I Mean 
                   % proposes a proper module in Windows. Linux throws a error
F=file3
```

Linux example:
``` prolog
?- dir('/'/A/B/C/D/E/F).
A = usr,
B = include,
C = 'c++',
D = '4.7',
E = ext,
F = pb_ds
```

``` prolog
?- file('/'/A/B/'smb.conf').
A = etc,
B = samba 
```
Possible bugs: Using Swi-Prolog dicts might cause problems.
