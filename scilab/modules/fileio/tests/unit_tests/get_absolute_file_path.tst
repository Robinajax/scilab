// =============================================================================
// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) 2008 - DIGITEO - Allan CORNET
//
//  This file is distributed under the same license as the Scilab package.
// =============================================================================

// <-- CLI SHELL MODE -->

ierr = execstr("get_absolute_file_path();","errcatch");
if ierr <> 77 then pause,end

ierr = execstr("get_absolute_file_path(''test.sce'',''test.sce'');","errcatch");
if ierr <> 77 then pause,end

current_dir = pwd()+ filesep();

a = mopen(TMPDIR+'/test.sce','wt');
// get_absolute_file_path since 5.1.1 returns path with path separator @ the end
d1 = get_absolute_file_path('test.sce');
mclose(a);
if d1 <> TMPDIR + filesep() then pause,end

// file 'test.sce' closed then not found
ierr = execstr('d3 = get_absolute_file_path(''test.sce'');','errcatch');
if ierr <> 999 then pause,end
