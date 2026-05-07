/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import JavApi

extension org.apache.xerces.xni {

  ///
  /// This exception is the base exception of all XNI exceptions. It
  /// can be constructed with an error message or used to wrap another
  /// exception object.
  ///
  /// - Note: By extending the Java
  /// <code>RuntimeException</code>, XNI handlers and components are
  /// not required to catch XNI exceptions but may explicitly catch
  /// them, if so desired.
  ///
  ///
  /// - Authors: Andy Clark, IBM
  ///
  public enum XNIException : Error {
    
    // - FIXME: Remove it after porting
    /// Serialization version.
    static let serialVersionUID = Int64(9019819772686063775)
    
    ///
    /// Constructs an XNI exception with a wrapped exception.
    ///
    /// - Parameters:
    ///   - exception: wrapped error
    ///   - message: error message
    ///
    case XNIException (_ exception : Error? = nil, _ message : String = "")
    
    ///
    /// - Returns: the wrapped exception.
    ///
    public func getException() -> Error? {
      switch self {
      case .XNIException(let exception, _) :
        return exception
      }
    }
    
    ///
    /// Initializes the cause of this <code>XNIException</code>.
    /// The value must be an instance of <code>Exception</code> or
    /// <code>nil</code>.
    ///
    /// - Parameter throwable: the cause
    /// - Returns: this exception
    ///
    /// - Throws: IllegalStateException if a cause has already been set
    /// - Throws: IllegalArgumentException if the cause is this exception
    ///
    public func initCause(_ throwable : java.lang.Throwable) throws -> Error {
      switch self {
      case .XNIException(let exception, _) :
        if exception == nil {
          throw java.lang.Throwable.IllegalArgumentException()
        }
        throw java.lang.Throwable.IllegalStateException()
      }
    }
    
    /// - Returns: the cause of this <code>XNIException</code>.
    public func getCause() -> Error? {
      return getException();
    }
    
  }
  
}
