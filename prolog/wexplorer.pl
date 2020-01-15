:- module(wexplorer,[show/2,select/2]).

show(dir,DirText):-
    atom(DirText),
    absolute_file_name(DirText,DirPath,[file_type(directory)]),
    exists_directory(DirPath),
    !,
    prolog_to_os_filename(DirPath,OS),
    atomic_list_concat(['explorer','/e',',',OS],' ',Comm),
    win_exec(Comm,show).

show(dir,SpecDir):-
    absolute_file_name(SpecDir,DirText),
    text_has_path(DirText,DirPath),
    exists_directory(DirPath),
    !,

    prolog_to_os_filename(DirPath,OS),atomic_list_concat(['explorer','/e',',',OS],' ',Comm),
    win_exec(Comm,show).

select(file,FileText):-
    atom(FileText),
    !,
    absolute_file_name(FileText,FilePath),
    exists_file(FilePath),

    prolog_to_os_filename(FilePath,OS),atomic_list_concat(['explorer','/select',',',OS],' ',Comm),
    win_exec(Comm,show).

select(file,SpecDir):-
    absolute_file_name(SpecDir,FileText),
    text_has_path(FileText,FilePath),
    exists_file(FilePath),

    prolog_to_os_filename(FilePath,OS),atomic_list_concat(['explorer','/select',',',OS],' ',Comm),
    win_exec(Comm,show).



text_has_path(Q,A):-
    atom_concat(Q,'/',A),!.

text_has_path(A,B):-
    atomic_concat(A,'/',B).
