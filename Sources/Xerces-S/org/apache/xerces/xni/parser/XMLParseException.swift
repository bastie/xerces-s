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

extension org.apache.xerces.xni.parser {
  
  /**
   * A parsing exception. This exception is different from the standard
   * XNI exception in that it stores the location in the document (or
   * its entities) where the exception occurred.
   *
   * @author Andy Clark, IBM
   *
   * @version $Id$
   */
  public class XMLParseException : org.apache.xerces.xni.XNIException, @unchecked Sendable, CustomStringConvertible {
    
    //
    // - MARK: Data
    //
    
    /** Public identifier. */
    var fPublicId : String?
    
    /** literal System identifier. */
    var fLiteralSystemId : String?
    
    /** expanded System identifier. */
    var fExpandedSystemId : String?
    
    /** Base system identifier. */
    var fBaseSystemId : String?
    
    /** Line number. */
    var fLineNumber = -1;
    
    /** Column number. */
    var fColumnNumber = -1;
    
    /** Character offset. */
    var fCharacterOffset = -1;
    
    //
    // Constructors
    //
    
    /**
     * Constructs an XML parse exception with an <code>XMLLocator</code> and a message.
     *
     * @param locator an <code>XMLLocator</code>
     * @param message the exception message
     */
    public init (_ locator : org.apache.xerces.xni.XMLLocator?, _ message : String) {
      super.init(nil,message);
      if let locator {
        fPublicId = locator.getPublicId();
        fLiteralSystemId = locator.getLiteralSystemId();
        fExpandedSystemId = locator.getExpandedSystemId();
        fBaseSystemId = locator.getBaseSystemId();
        fLineNumber = locator.getLineNumber();
        fColumnNumber = locator.getColumnNumber();
        fCharacterOffset = locator.getCharacterOffset();
      }
    } // <init>(XMLLocator,String)
    
    /**
     * Constructs an XML parse exception with an <code>XMLLocator</code>, a message, and a wrapped exception.
     *
     * @param locator an <code>XMLLocator</code>
     * @param message the exception message
     * @param exception the wrapped exception
     */
    public init (_ locator : org.apache.xerces.xni.XMLLocator?,
                 _ message : String, _ exception : java.lang.Throwable) {
      super.init(exception, message);
      if let locator {
        fPublicId = locator.getPublicId();
        fLiteralSystemId = locator.getLiteralSystemId();
        fExpandedSystemId = locator.getExpandedSystemId();
        fBaseSystemId = locator.getBaseSystemId();
        fLineNumber = locator.getLineNumber();
        fColumnNumber = locator.getColumnNumber();
        fCharacterOffset = locator.getCharacterOffset();
      }
    } // <init>(XMLLocator,String,Exception)
    
    //
    // Public methods
    //
    
    /** Returns the public identifier. */
    public func getPublicId() -> String? {
      return fPublicId;
    } // getPublicId():String
    
    /** Returns the expanded system identifier. */
    public func getExpandedSystemId() -> String? {
      return fExpandedSystemId;
    } // getExpandedSystemId():String
    
    /** Returns the literal system identifier. */
    public func getLiteralSystemId() -> String?{
      return fLiteralSystemId;
    } // getLiteralSystemId():String
    
    /** Returns the URI against which the system identifier should be resolved. */
    public func getBaseSystemId() -> String?{
      return fBaseSystemId;
    } // getBaseSystemId():String
    
    /** Returns the line number. */
    public func getLineNumber() -> Int{
      return fLineNumber;
    } // getLineNumber():int
    
    /** Returns the row number. */
    public func getColumnNumber() -> Int {
      return fColumnNumber;
    } // getRowNumber():int
    
    /** Returns the character offset. */
    public func getCharacterOffset() -> Int{
      return fCharacterOffset;
    } // getCharacterOffset():int
    
    //
    // - MARK: Object methods
    //
    
    /** Returns a string representation of this object. */
    public func toString() -> String {
      return description
    }
    
    public var description: String {
      
      
      var str = ""
      if let fPublicId {
        str.append(fPublicId);
      }
      str.append(":");
      if let fLiteralSystemId {
        str.append(fLiteralSystemId);
      }
      str.append(":");
      if let fExpandedSystemId  {
        str.append(fExpandedSystemId);
      }
      str.append(":");
      if let fBaseSystemId {
        str.append(fBaseSystemId);
      }
      str.append(":\(fLineNumber):\(fColumnNumber):\(fCharacterOffset):");
      if let message = getMessage() {
        str.append(message);
      }
      else {
        if let exception = getException(){
          // FIXME: after JavApi switch to typed exception use: str.append(exception.getMessage())
          str.append(Mirror(reflecting: exception).description)
        }
      }
      return str
      
    }
  
    
  } // XMLParseException
}
