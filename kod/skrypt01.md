## Preprocessing dla naszego pliku

Tak wygląda oryginalnie po wykonaniu komendy `eegh`. Wiele linijek nie jest nam jednak potrzebnych.
```matlab
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
EEG = pop_loadset('filename','CAT302 task2.set','filepath','C:\\proj\\AnalizaDanychEEG01-master\\dane\\');
[ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
EEG = pop_eegfiltnew(EEG, [], 1, 826, true, [], 0);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off'); 
EEG = eeg_checkset( EEG );
pop_eegplot( EEG, 1, 1, 1);
EEG=pop_chanedit(EEG, 'load',{'C:\\proj\\AnalizaDanychEEG01-master\\dane\\GSN-HydroCel-65 1.0.sfp' 'filetype' 'autodetect'},'changefield',{68 'datachan' 0},'setref',{'1:67' 'Cz'});
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
EEG = eeg_checkset( EEG );
EEG = pop_epoch( EEG, {  'car_0'  'car_180'  'car_90'  'face_0'  'face_180'  'face_90'  }, [-0.25         0.5], 'newname', 'epochs', 'epochinfo', 'yes');
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off'); 
EEG = eeg_checkset( EEG );
EEG = pop_rmbase( EEG, [-252    0]);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off'); 
EEG = eeg_checkset( EEG );
pop_eegplot( EEG, 1, 1, 1);
EEG = pop_rejepoch( EEG, [15 24 29 57 61 98 112 277 278] ,0);
[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'overwrite','on','gui','off'); 
EEG = eeg_checkset( EEG );
EEG = pop_runica(EEG, 'extended',1,'interupt','on');
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
```
