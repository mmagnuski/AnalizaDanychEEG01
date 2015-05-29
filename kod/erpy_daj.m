function erp = erpy_daj(EEG, kanaly, epoki, varargin)

% ERPY_DAJ pozwala uzyskać potencjały wywołane
% z danych EEG dla wybranych kanałów i epok

iscomp = any(strcmp('ica', varargin));

% jeżeli pewne zmienne nie istnieją - 
% ustawiamy wartości domyślne
if ~exist('kanaly', 'var') || isempty(kanaly)
    kanaly = 1:EEG.nbchan;
end
if ~exist('epoki', 'var') || isempty(epoki)
    epoki = 1:EEG.trials;
end

% jeżeli kanały podane zostały po nazwach 
if ischar(kanaly)
	kanaly = {kanaly};
end
if iscell(kanaly)
	kanaly = find_elec(EEG, kanaly);
end

% jeżeli podano epoki jako nazwę warunku
if ischar(epoki)
	epoki = find(epoch_centering_events(EEG, epoki));
end

if ~iscomp
	erp = mean(EEG.data(kanaly, :, epoki), 3);
else
	ica_data = get_ica_data(EEG, kanaly);
	erp = mean(ica_data(:, :, epoki), 3)
end