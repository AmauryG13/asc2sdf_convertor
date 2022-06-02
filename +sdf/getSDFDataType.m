function [DataType] = getSDFDataType(value)

switch value
    case 0
        DataType.format = 'uchar=>double'; % Unsigned char : 1 byte
        DataType.dBytes = 1;
    case 1
        DataType.format = 'uint16=>double'; % Unsigned int : 2 bytes
        DataType.dBytes = 2;
    case 2
        DataType.format = 'ulong=>double'; % Unsigned long : 4 bytes
        DataType.dBytes = 4;
    case 3
        DataType.format = 'single=>double'; % float : 4 bytes
        DataType.dBytes = 4;
    case 4
        DataType.format = 'schar=>double'; % Signed char : 1 byte
        DataType.dBytes = 1;
    case 5
        DataType.format = 'int16=>double'; % Signed int : 2 bytes
        DataType.dBytes = 2;
    case 6
        DataType.format = 'long=>double'; % Signed long : 4 bytes
        DataType.dBytes = 4;
    case 7
        DataType.format = 'double=>double'; % Double : 8 bytes
        DataType.dBytes = 8;
    otherwise
        error('Data type for this file is unknown');
end

end
