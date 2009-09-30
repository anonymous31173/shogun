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


% Plugin Estimate
disp('PluginEstimate w/ HistogramWord');

sg('set_features', 'TRAIN', fm_train_dna, 'DNA');
sg('convert', 'TRAIN', 'STRING', 'CHAR', 'STRING', 'WORD', order, order-1, gap, reverse);

sg('set_features', 'TEST', fm_test_dna, 'DNA');
sg('convert', 'TEST', 'STRING', 'CHAR', 'STRING', 'WORD', order, order-1, gap, reverse);

pseudo_pos=1e-1;
pseudo_neg=1e-1;
sg('new_plugin_estimator', pseudo_pos, pseudo_neg);
sg('set_labels', 'TRAIN', label_train_dna);
sg('train_estimator');

sg('set_kernel', 'HISTOGRAM', 'WORD', size_cache);
km=sg('get_kernel_matrix', 'TRAIN');

% not supported yet;
%	lab=sg('plugin_estimate_classify');
km=sg('get_kernel_matrix', 'TEST');
