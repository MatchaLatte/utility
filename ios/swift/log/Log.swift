/**
The MIT License (MIT)

Copyright (c) 2015 Matcha Latte

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

import Swift

private enum LogLevel {
    case Verbase
    case Debug
    case Info
    case Warn
    case Error
    
    func toString() -> String {
        switch self {
        case .Verbase:  return "V";
        case .Debug:    return "D";
        case .Info:     return "I";
        case .Warn:     return "W";
        case .Error:    return "E";
        }
    }
    
    func isEnable() -> Bool {
        switch self {
        case .Verbase:  return true;
        case .Debug:    return true;
        case .Info:     return true;
        case .Warn:     return true;
        case .Error:    return true;
        }
    }
}

class Log {
    class func v(message: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
        Log.println(LogLevel.Verbase, message: message, file: file, function: function, line: line);
    }
    
    class func d(message: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
        Log.println(LogLevel.Debug, message: message, file: file, function: function, line: line);
    }
    
    class func i(message: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
        Log.println(LogLevel.Info, message: message, file: file, function: function, line: line);
    }
    
    class func w(message: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
        Log.println(LogLevel.Warn, message: message, file: file, function: function, line: line);
    }
    
    class func e(message: String, file: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
        Log.println(LogLevel.Error, message: message, file: file, function: function, line: line);
    }
    
    private class func println(level: LogLevel, message: String, file: String, function: String, line: Int) {
        if (!level.isEnable()) {
            return;
        }
        
        Swift.println("[\(level.toString())][\(file.lastPathComponent)(L.\(line)) \(function)]: \(message)");
    }
}