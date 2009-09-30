size_cache=10;

addpath('tools');
fm_train_real=load_matrix('../data/fm_train_real.dat');
fm_test_real=load_matrix('../data/fm_test_real.dat');
label_train_dna=load_matrix('../data/label_train_dna.dat');
fm_train_dna=load_matrix('../data/fm_train_dna.dat');
fm_test_dna=load_matrix('../data/fm_test_dna.dat');
fm_train_word=uint16(load_matrix('../data/fm_train_word.dat'));
fm_test_word=uint16(load_matrix('../data/fm_test_word.dat'));
fm_train_byte=uint8(load_matrix('../data/fm_train_byte.dat'));
fm_test_byte=uint8(load_matrix('../data/fm_test_byte.dat'));

% Sparse Linear
disp('SparseLinear');

scale=1.3;

sg('set_kernel', 'LINEAR', 'SPARSEREAL', size_cache, scale);

sg('set_features', 'TRAIN', sparse(fm_train_real));
km=sg('get_kernel_matrix', 'TRAIN');

sg('set_features', 'TEST', sparse(fm_test_real));
km=sg('get_kernel_matrix', 'TEST');
