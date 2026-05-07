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

extension org.apache.xerces.xni {
  
  /// This represents the basic physical description of the location of any
  /// XML resource (a Schema grammar, a DTD, a general entity etc.)
  ///
  /// - Authors: Neil Graham, IBM
  public protocol XMLResourceIdentifier {
    
    /// Sets the public identifier.
    ///
    /// - Parameter publicId: the identifier
    func setPublicId(_ publicId : String)
    
    /// - Returns : the public identifier.
    func getPublicId() -> String
    
    /// Sets the expanded system identifier.
    ///
    /// - Parameter systemId: the expanded system identifier
    func setExpandedSystemId(_ systemId : String)
    
    /// - Returns: the expanded system identifier.
    func getExpandedSystemId() -> String
    
    ///
    /// Sets the literal system identifier.
    ///
    /// - Parameter systemId: the literal system identifier
    func setLiteralSystemId(_ systemId : String)
    
    /// - Returns: the literal system identifier
    func getLiteralSystemId() -> String
    
    ///Sets the base URI against which the literal SystemId is to be resolved.
    ///
    /// - Parameter systemId: the base URI
    func setBaseSystemId(_ systemId : String)
    
    /// - Returns: the base URI against which the literal SystemId is to be resolved
    func getBaseSystemId() -> String
    
    /// Sets the namespace of the resource.
    ///
    /// - Parameter namespace: the namespace
    func setNamespace(_ namespace : String)
    
    /// - Returns: the namespace of the resource.
    func getNamespace() -> String
  }
}

