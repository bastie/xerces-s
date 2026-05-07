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
  
  /**
   * A structure that holds the components of an XML Namespaces qualified
   * name.
   * <p>
   * To be used correctly, the strings must be identical references for
   * equal strings. Within the parser, these values are considered symbols
   * and should always be retrieved from the <code>SymbolTable</code>.
   * </p>
   *
   * @see <a href="../../../../../xerces2/org/apache/xerces/util/SymbolTable.html">org.apache.xerces.util.SymbolTable</a>
   *
   * @author Andy Clark, IBM
   *
   * @version $Id$
   */
  public class QName : java.lang.Cloneable, CustomStringConvertible, Equatable, Hashable {
    
    /**
     * The qname's prefix. For example, the prefix for the qname "a:foo" is "a".
     */
    public var `prefix` : String? = nil
    
    /**
     * The qname's local part. For example, the localpart for the qname "a:foo" is "foo".
     */
    public var localpart : String? = nil
    
    /**
     * The qname's raw name. For example, the rawname for the qname "a:foo" is "a:foo".
     */
    public var rawname : String? = nil
    
    /**
     * The URI to which the qname's prefix is bound. This binding must be
     * performed by a XML Namespace-aware processor.
     */
    public var uri : String? = nil
    
    //
    // Constructors
    //
    
    /** Default constructor. */
    public init() {
      clear()
    } // <init>()
    
    /**
     * Constructs a QName with the specified values.
     * @param prefix    the qname prefix (e.g. "a")
     * @param localpart the qname local part (e.g. "foo")
     * @param rawname   the qname raw name (e.g. "a:foo")
     * @param uri       the URI binding (e.g. "http://foo.com/mybinding")
     */
    public init(_ prefix : String?, _ localpart : String?, _ rawname : String?, _ uri : String?) {
      setValues(prefix, localpart, rawname, uri);
    } // <init>(String,String,String,String)
    
    /**
     * Constructs a copy of the specified QName.
     * @param qname the qualified name
     */
    public init(_ qname : QName) {
      setValues(qname);
    } // <init>(QName)
    
    //
    // Public methods
    //
    
    /**
     * Convenience method to set the values of the qname components.
     *
     * @param qname the qualified name to be copied
     */
    public func setValues(_ qname : QName) {
      `prefix` = qname.prefix;
      localpart = qname.localpart;
      rawname = qname.rawname;
      uri = qname.uri;
    } // setValues(QName)
    
    /**
     * Convenience method to set the values of the qname components.
     *
     * @param prefix    the qname prefix. (e.g. "a")
     * @param localpart the qname local part. (e.g. "foo")
     * @param rawname   the qname raw name. (e.g. "a:foo")
     * @param uri       the URI binding. (e.g. "http://foo.com/mybinding")
     */
    public func setValues(_ prefix : String?, _ localpart : String?, _ rawname : String?, _ uri : String?) {
      self.prefix = prefix;
      self.localpart = localpart;
      self.rawname = rawname;
      self.uri = uri;
    } // setValues(String,String,String,String)
    
    /** Clears the values of the qname components. */
    public func clear() {
      self.prefix = nil;
      localpart = nil;
      rawname = nil;
      uri = nil;
    } // clear()
    
    // - MARK: Cloneable methods
    /**
     * Returns a clone of this object.
     *
     * @return a clone of this object
     */
    public func clone() throws -> org.apache.xerces.xni.QName {
      return QName(`prefix`, localpart, rawname, uri)
    }
    
    public typealias Cloneable = QName
    

    //
    // - MARK: Object methods
    //
    
    /**
     * Returns the hashcode for this object.
     *
     * @return the hashcode for this object
     */
    public func hashCode() -> Int {
      return hashValue // it is magic and returns the Hasher result from hash function
    }
    func hash (into hasher: inout Hasher) {
      if let uri {
        hasher.combine(uri)
        
        if let localpart {
          hasher.combine(localpart)
        }
      } else if let rawname {
        hasher.combine(rawname)
      }
    }
    
    /**
     * Returns true if the two objects are equal.
     *
     * @return true if the two objects are equal
     */
    public func equals(_ object : AnyObject) -> Bool{
      guard let other = object as? QName else {
        return false
      }
      return self == other
    }
    static func == (lhs: QName, rhs: QName) -> Bool {
      if (rhs.uri != nil) {
        return lhs.uri == rhs.uri && lhs.localpart == rhs.localpart;
      }
      else if (lhs.uri == nil) {
        return lhs.rawname == rhs.rawname;
      }
      return false;
    }

    /**
     * Returns a string representation of this object.
     *
     * @return a string representation of this object
     */
    public var description: String {
      
      var str = ""
      var comma = false;
      if let `prefix` = self.prefix {
        str.append("prefix=\"")
        str.append(`prefix`)
        str.append("\"")
        comma = true;
      }
      if let localpart {
        if (comma) {
          str.append(",")
        }
        str.append("localpart=\"")
        str.append(localpart)
        str.append("\"")
        comma = true;
      }
      if let rawname {
        if (comma) {
          str.append(",");
        }
        str.append("rawname=\"")
        str.append(rawname)
        str.append("\"")
        comma = true;
      }
      if let uri {
        if (comma) {
          str.append(",");
        }
        str.append("uri=\"")
        str.append(uri)
        str.append("\"");
      }
      return str
      
    } // toString():String
    
    public func toString() -> String {
      return self.description
    }
    
  } // class QName
}
