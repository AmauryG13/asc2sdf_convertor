classdef Convertor < handle
    %CONVERTOR Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        ascOptions = struct( ...
            'Headers', 12, ...
            'Delimiter', '\t', ...
            'DecimalSep', '.');
        
        analysis = struct(...
            'clean', 1, ...
            'recenter', 1 ...
        );
    end
    
    methods
        function self = Convertor(ascOptions, analysis)
            %CONVERTOR Construct an instance of this class
            %   Detailed explanation goes here
            
            if ~exist('ascOptions', 'var')
                ascOptions = [];
            end
            
            if ~exist('analysis', 'var')
                analysis = [];
            end
            
            self.ascOptions = utils.mergeStruct( ...
                self.ascOptions, ...
                ascOptions ...
            );
        
            self.analysis = utils.mergeStruct( ...
                self.analysis, ...
                analysis ...
            );
        end
        
        function state = convert(self, filepath, destFolder)
            ascHeaders = asc.read_headers(filepath, self.ascOptions);
            
            raw = asc.read_data( ...
                filepath, ...
                [ascHeaders.x_pixels, ascHeaders.y_pixels], ...
                self.ascOptions);
    
            if self.analysis.clean
                raw = utils.cleanMeasure(raw);
            end
            
            if self.analysis.recenter
                raw = utils.recenterAmplitude(raw);
            end
    
            switch ascHeaders.z_unit
                case 'um'
                    factor = 10^(-6);
                otherwise
                    factor = 10^(-6);
            end
    
            sdfHeaders = sdf.createHeadersStruct;
            sdfHeaders = sdf.popluateHeadersDefault(sdfHeaders);
            sdfHeaders = sdf.populateHeadersScale(sdfHeaders, ...
                [ ...
                ((ascHeaders.x_length * factor)  / ascHeaders.x_pixels), ... X scale
                ((ascHeaders.y_length * factor) / ascHeaders.y_pixels), ... Y scale
                factor, ... Z scale
                -1e+6 ... Z resolution
                ] ...
            );
    
            sdfData.headers = sdfHeaders;
            sdfData.image = raw;
    
            [~, name] = fileparts(filepath);
            sdfFilepath = utils.renameOutputFile( ...
                destFolder, ...
                strcat(name, '.sdf') ...
            );
            
            try
                sdf.write_image(sdfFilepath, sdfData);
            catch ME
                state = false;
            end
            
            state = true;
            
        end
    end
    
    methods (Static)
        function openGUI()
            convertorSimpleGUI();
        end
    end
end

