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

  /**
   * The DTD handler interface defines callback methods to report
   * information items in the DTD of an XML document. Parser components
   * interested in DTD information implement this interface and are
   * registered as the DTD handler on the DTD source.
   *
   * @see XMLDTDContentModelHandler
   *
   * @author Andy Clark, IBM
   *
   * @version $Id$
   */
  public protocol XMLDTDHandler {
    
    //
    // Constants
    //
    
    /**
     * Conditional section: INCLUDE.
     *
     * @see XMLDTDHandler#CONDITIONAL_IGNORE
     */
    static var CONDITIONAL_INCLUDE : Int16 { get }// = 0;
    
    /**
     * Conditional section: IGNORE.
     *
     * @see XMLDTDHandler#CONDITIONAL_INCLUDE
     */
    static var CONDITIONAL_IGNORE : Int16 { get } // = 1;
    
    //
    // XMLDTDHandler methods
    //
    
    /**
     * The start of the DTD.
     *
     * @param locator  the document locator, or null if the document
     *                 location cannot be reported during the parsing of
     *                 the document DTD. However, it is <em>strongly</em>
     *                 recommended that a locator be supplied that can
     *                 at least report the base URI of the DTD.
     * @param augmentations additional information that may include infoset augmentations
     * @throws XNIException thrown by handler to signal an error
     */
    func startDTD(_ locator : XMLLocator, _ augmentations : Augmentations)
    throws (XNIException)
    
    /**
     * This method notifies of the start of a parameter entity. The parameter
     * entity name start with a '%' character.
     *
     * @param name the name of the parameter entity
     * @param identifier the resource identifier
     * @param encoding the auto-detected IANA encoding name of the entity stream. This
     *                 value will be null in those situations where the entity encoding
     *                 is not auto-detected (e.g. internal parameter entities).
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     */
    func startParameterEntity(_ name : String,
                              identifier : XMLResourceIdentifier,
                              _ encoding : String,
                                     _ augmentations : Augmentations) throws (XNIException)
    
    /**
     * Notifies of the presence of a TextDecl line in an entity. If present,
     * this method will be called immediately following the startEntity call.
     * <p>
     * <strong>Note:</strong> This method is only called for external
     * parameter entities referenced in the DTD.
     *
     * @param version the XML version, or null if not specified
     * @param encoding the IANA encoding name of the entity
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     */
    func textDecl(_ version : String, _ encoding : String,
                         _ augmentations : Augmentations) throws (XNIException)
    
    /**
     * This method notifies the end of a parameter entity. Parameter entity
     * names begin with a '%' character.
     *
     * @param name the name of the parameter entity
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     */
    func endParameterEntity(_ name : String, _ augmentations : Augmentations)
    throws (XNIException)
    
    /**
     * The start of the DTD external subset.
     *
     * @param identifier the resource identifier
     * @param augmentations additional information that may include infoset augmentations
     * @throws XNIException thrown by handler to signal an error
     */
    func startExternalSubset(_ identifier : XMLResourceIdentifier,
                                    _ augmentations : Augmentations)
    throws (XNIException)
    
    /**
     * The end of the DTD external subset.
     *
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     */
    func endExternalSubset(_ augmentations : Augmentations)
    throws (XNIException)
    
    /**
     * A comment.
     *
     * @param text the text in the comment
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by application to signal an error
     */
    func comment(_ text : XMLString, _ augmentations : Augmentations)
    throws (XNIException)
    
    /**
     * A processing instruction. Processing instructions consist of a
     * target name and, optionally, text data. The data is only meaningful
     * to the application.
     * <p>
     * Typically, a processing instruction's data will contain a series
     * of pseudo-attributes. These pseudo-attributes follow the form of
     * element attributes but are <strong>not</strong> parsed or presented
     * to the application as anything other than text. The application is
     * responsible for parsing the data.
     *
     * @param target the target
     * @param data the data or null if none specified
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     */
    func processingInstruction(_ target : String, _ data : XMLString,
                                      _ augmentations : Augmentations)
    throws (XNIException)
    
    /**
     * An element declaration.
     *
     * @param name the name of the element
     * @param contentModel the element content model
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     */
    func elementDecl(_ name : String, _ contentModel : String,
                            _ augmentations : Augmentations)
    throws (XNIException)
    
    /**
     * The start of an attribute list.
     *
     * @param elementName the name of the element that this attribute list is associated with
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     */
    func startAttlist(_ elementName : String,
                             _ augmentations : Augmentations) throws (XNIException)
    
    /**
     * An attribute declaration.
     *
     * @param elementName the name of the element that this attribute is associated with
     * @param attributeName the name of the attribute
     * @param type the attribute type. This value will be one of the following:
     *             "CDATA", "ENTITY", "ENTITIES", "ENUMERATION", "ID", "IDREF", "IDREFS",
     *             "NMTOKEN", "NMTOKENS", or "NOTATION"
     * @param enumeration if the type has the value "ENUMERATION" or "NOTATION", this array
     *                    holds the allowed attribute values; otherwise, this array is null
     * @param defaultType the attribute default type. This value will be one of the following:
     *                    "#FIXED", "#IMPLIED", "#REQUIRED", or null
     * @param defaultValue the attribute default value, or null if no default value is specified
     * @param nonNormalizedDefaultValue the attribute default value with no normalization
     *                                  performed, or null if no default value is specified
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     */
    func attributeDecl(_ elementName : String, _ attributeName : String,
                       _ type : String, _ enumeration : [String]?,
                              _ defaultType : String, _ defaultValue : XMLString,
                       _ nonNormalizedDefaultValue : XMLString, _ augmentations : Augmentations)
    throws (XNIException)
    
    /**
     * The end of an attribute list.
     *
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     */
    func endAttlist(_ augmentations : Augmentations) throws (XNIException)
    
    /**
     * An internal entity declaration.
     *
     * @param name the name of the entity. Parameter entity names start with '%', whereas
     *             the name of a general entity is just the entity name
     * @param text the value of the entity
     * @param nonNormalizedText the non-normalized value of the entity. This
     *             value contains the same sequence of characters that was in
     *             the internal entity declaration, without any entity
     *             references expanded.
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     */
    func internalEntityDecl(_ name : String, _ text : XMLString,
                            _ nonNormalizedText : XMLString,
                                   _ augmentations : Augmentations)
    throws (XNIException)
    
    /**
     * An external entity declaration.
     *
     * @param name the name of the entity. Parameter entity names start with '%', whereas
     *             the name of a general entity is just the entity name
     * @param identifier an object containing all location information pertinent to this
     *                   external entity
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     */
    func externalEntityDecl(_ name : String,
                            _ identifier : XMLResourceIdentifier,
                                   _ augmentations : Augmentations)
    throws (XNIException)
    
    /**
     * An unparsed entity declaration.
     *
     * @param name the name of the entity
     * @param identifier an object containing all location information pertinent to this
     *                   unparsed entity declaration
     * @param notation the name of the notation
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     */
    func unparsedEntityDecl(_ name : String,
                            _ identifier : XMLResourceIdentifier,
                            _ notation : String, _ augmentations : Augmentations)
    throws (XNIException)
    
    /**
     * A notation declaration
     *
     * @param name the name of the notation
     * @param identifier an object containing all location information pertinent to this notation
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     */
    func notationDecl(_ name : String, _ identifier : XMLResourceIdentifier,
                             _ augmentations : Augmentations) throws (XNIException)
    
    /**
     * The start of a conditional section.
     *
     * @param type the type of the conditional section. This value will either be
     *             CONDITIONAL_INCLUDE or CONDITIONAL_IGNORE
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     *
     * @see XMLDTDHandler#CONDITIONAL_INCLUDE
     * @see XMLDTDHandler#CONDITIONAL_IGNORE
     */
    func startConditional(_ type : Int16, _ augmentations : Augmentations)
    throws (XNIException)
    
    /**
     * Characters within an IGNORE conditional section.
     *
     * @param text the ignored text
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     */
    func ignoredCharacters(_ text : XMLString, _ augmentations : Augmentations)
    throws (XNIException)
    
    /**
     * The end of a conditional section.
     *
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     */
    func endConditional(_ augmentations : Augmentations) throws (XNIException)
    
    /**
     * The end of the DTD.
     *
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     */
    func endDTD(_ augmentations : Augmentations) throws (XNIException)
    
    /**
     * Sets the source of this handler.
     *
     * @param source the source of this handler
     */
    func setDTDSource(_ source : org.apache.xerces.xni.parser.XMLDTDSource)
    
    /**
     * Returns the source from which this handler derives its events.
     *
     * @return the source from which this handler derives its events
     */
    func getDTDSource() -> org.apache.xerces.xni.parser.XMLDTDSource
    
  } // interface XMLDTDHandler
}

extension org.apache.xerces.xni.XMLDTDHandler {
  /**
   * Conditional section: INCLUDE.
   *
   * @see XMLDTDHandler#CONDITIONAL_IGNORE
   */
  static var CONDITIONAL_INCLUDE : Int16 { 0 }// = 0;
  
  /**
   * Conditional section: IGNORE.
   *
   * @see XMLDTDHandler#CONDITIONAL_INCLUDE
   */
  static var CONDITIONAL_IGNORE : Int16 { 1 } // = 1;
  

}
