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
   * The XMLAttributes interface defines a collection of attributes for
   * an element. In the parser, the document source would scan the entire
   * start element and collect the attributes. The attributes are
   * communicated to the document handler in the startElement method.
   * <p>
   * The attributes are read-write so that subsequent stages in the document
   * pipeline can modify the values or change the attributes that are
   * propagated to the next stage.
   *
   * @see XMLDocumentHandler#startElement
   *
   * @author Andy Clark, IBM
   *
   */
  public protocol XMLAttributes {
    
    
    /**
     * Adds an attribute. The attribute's non-normalized value of the
     * attribute will have the same value as the attribute value until
     * set using the <code>setNonNormalizedValue</code> method. Also,
     * the added attribute will be marked as specified in the XML instance
     * document unless set otherwise using the <code>setSpecified</code>
     * method.
     * <p>
     * <strong>Note:</strong> If an attribute of the same name already
     * exists, the old values for the attribute are replaced by the new
     * values.
     *
     * @param attrName  The attribute name.
     * @param attrType  The attribute type. The type name is determined by
     *                  the type specified for this attribute in the DTD.
     *                  For example: "CDATA", "ID", "NMTOKEN", etc. However,
     *                  attributes of type enumeration will have the type
     *                  value specified as the pipe ('|') separated list of
     *                  the enumeration values prefixed by an open
     *                  parenthesis and suffixed by a close parenthesis.
     *                  For example: "(true|false)".
     * @param attrValue The attribute value.
     *
     * @return Returns the attribute index.
     *
     * @see #setNonNormalizedValue
     * @see #setSpecified
     */
    func addAttribute(_ attrName : QName, _ attrType : String, _ attrValue : String) -> Int
    
    /**
     * Removes all of the attributes. This method will also remove all
     * entities associated to the attributes.
     */
    func removeAllAttributes()
    
    /**
     * Removes the attribute at the specified index.
     * <p>
     * <strong>Note:</strong> This operation changes the indexes of all
     * attributes following the attribute at the specified index.
     *
     * @param attrIndex The attribute index.
     */
    func removeAttributeAt(_ attrIndex : Int)
    
    /**
     * Returns the number of attributes in the list.
     * <p>
     * Once you know the number of attributes, you can iterate
     * through the list.
     * </p>
     *
     * @return the number of attributes in the list
     *
     * @see #getURI(int)
     * @see #getLocalName(int)
     * @see #getQName(int)
     * @see #getType(int)
     * @see #getValue(int)
     */
    func getLength() -> Int
    
    /**
     * Look up the index of an attribute by XML 1.0 qualified name.
     *
     * @param qName the qualified (prefixed) name
     *
     * @return the index of the attribute, or -1 if it does not
     *         appear in the list
     */
    func getIndex(_ qName : String) -> Int
    
    /**
     * Look up the index of an attribute by Namespace name.
     *
     * @param uri       The Namespace URI, or the empty string if
     *                  the name has no Namespace URI.
     * @param localPart The attribute's local name.
     *
     * @return The index of the attribute, or -1 if it does not
     *         appear in the list.
     */
    func getIndex(_ uri : String, _ localPart : String) -> Int
    
    /**
     * Sets the name of the attribute at the specified index.
     *
     * @param attrIndex The attribute index.
     * @param attrName  The new attribute name.
     */
    func setName(_ attrIndex : Int, _ attrName : QName)
    
    /**
     * Sets the fields in the given QName structure with the values
     * of the attribute name at the specified index.
     *
     * @param attrIndex The attribute index.
     * @param attrName  The attribute name structure to fill in.
     */
    // - FIXME: a setter with get prefix is IMHO not correct
    func getName(_ attrIndex : Int, _ attrName : QName)
    
    /**
     * Returns the prefix of the attribute at the specified index.
     *
     * @param index the index of the attribute
     * @return the prefix of the attribute at the specified index
     */
    func getPrefix(_ index : Int) -> String
    
    /**
     * Look up an attribute's Namespace URI by index.
     *
     * @param index The attribute index (zero-based).
     *
     * @return The Namespace URI, or the empty string if none
     *         is available, or null if the index is out of
     *         range.
     *
     * @see #getLength
     */
    func getURI(_ index : Int) -> String
    
    /**
     * Look up an attribute's local name by index.
     *
     * @param index The attribute index (zero-based).
     *
     * @return The local name, or the empty string if Namespace
     *         processing is not being performed, or null
     *         if the index is out of range.
     *
     * @see #getLength
     */
    func getLocalName(_ index : Int) -> String
    
    /**
     * Look up an attribute's XML 1.0 qualified name by index.
     *
     * @param index The attribute index (zero-based).
     *
     * @return The XML 1.0 qualified name, or the empty string
     *         if none is available, or null if the index
     *         is out of range.
     *
     * @see #getLength
     */
    func getQName(_ index : Int) -> String
    
    /**
     * Sets the type of the attribute at the specified index.
     *
     * @param attrIndex The attribute index.
     * @param attrType  The attribute type. The type name is determined by
     *                  the type specified for this attribute in the DTD.
     *                  For example: "CDATA", "ID", "NMTOKEN", etc. However,
     *                  attributes of type enumeration will have the type
     *                  value specified as the pipe ('|') separated list of
     *                  the enumeration values prefixed by an open
     *                  parenthesis and suffixed by a close parenthesis.
     *                  For example: "(true|false)".
     */
    func setType(_ attrIndex : Int, _ attrType : String);
    
    /**
     * Look up an attribute's type by index.
     * <p>
     * The attribute type is one of the strings "CDATA", "ID",
     * "IDREF", "IDREFS", "NMTOKEN", "NMTOKENS", "ENTITY", "ENTITIES",
     * or "NOTATION" (always in upper case).
     * <p>
     * If the parser has not read a declaration for the attribute,
     * or if the parser does not report attribute types, then it must
     * return the value "CDATA" as stated in the XML 1.0 Recommendation
     * (clause 3.3.3, "Attribute-Value Normalization").
     * <p>
     * For an enumerated attribute that is not a notation, the
     * parser will report the type as "NMTOKEN".
     *
     * @param index The attribute index (zero-based).
     *
     * @return The attribute's type as a string, or null if the
     *         index is out of range.
     *
     * @see #getLength
     */
    func getType(_ index : Int) -> String
    
    /**
     * Look up an attribute's type by XML 1.0 qualified name.
     * <p>
     * See {@link #getType(int) getType(int)} for a description
     * of the possible types.
     *
     * @param qName the XML 1.0 qualified name
     *
     * @return the attribute type as a string, or null if the
     *         attribute is not in the list or if qualified names
     *         are not available
     */
    func getType(_ qName : String) -> String
    
    /**
     * Look up an attribute's type by Namespace name.
     * <p>
     * See {@link #getType(int) getType(int)} for a description
     * of the possible types.
     *
     * @param uri       The Namespace URI, or the empty String if the
     *                  name has no Namespace URI.
     * @param localName The local name of the attribute.
     *
     * @return The attribute type as a string, or null if the
     *         attribute is not in the list or if Namespace
     *         processing is not being performed.
     */
    func getType(_ uri : String, _ localName : String) -> String
    
    /**
     * Sets the value of the attribute at the specified index. This
     * method will overwrite the non-normalized value of the attribute.
     *
     * @param attrIndex The attribute index.
     * @param attrValue The new attribute value.
     *
     * @see #setNonNormalizedValue
     */
    func setValue(_ attrIndex : Int, _ attrValue : String)
    
    /**
     * Look up an attribute's value by index.
     * <p>
     * If the attribute value is a list of tokens (IDREFS,
     * ENTITIES, or NMTOKENS), the tokens will be concatenated
     * into a single string with each token separated by a
     * single space.
     *
     * @param index The attribute index (zero-based).
     *
     * @return The attribute's value as a string, or null if the
     *         index is out of range.
     *
     * @see #getLength
     */
    func getValue(_ index : Int) -> String
    
    /**
     * Look up an attribute's value by XML 1.0 qualified name.
     * <p>
     * See {@link #getValue(int) getValue(int)} for a description
     * of the possible values.
     *
     * @param qName the XML 1.0 qualified name
     *
     * @return the attribute value as a string, or null if the
     *         attribute is not in the list or if qualified names
     *         are not available
     */
    func getValue(_ qName : String) -> String
    
    /**
     * Look up an attribute's value by Namespace name.
     * <p>
     * See {@link #getValue(int) getValue(int)} for a description
     * of the possible values.
     *
     * @param uri       The Namespace URI, or the empty String if the
     *                  name has no Namespace URI.
     * @param localName The local name of the attribute.
     *
     * @return The attribute value as a string, or null if the
     *         attribute is not in the list.
     */
    func getValue(_ uri : String, _ localName : String) -> String
    
    /**
     * Sets the non-normalized value of the attribute at the specified
     * index.
     *
     * @param attrIndex The attribute index.
     * @param attrValue The new non-normalized attribute value.
     */
    func setNonNormalizedValue(_ attrIndex : Int, _ attrValue : String)
    
    /**
     * Returns the non-normalized value of the attribute at the specified
     * index. If no non-normalized value is set, this method will return
     * the same value as the <code>getValue(int)</code> method.
     *
     * @param attrIndex the attribute index
     * @return the non-normalized value of the attribute at the specified index
     */
    func getNonNormalizedValue(_ attrIndex : Int) -> String
    
    /**
     * Sets whether an attribute is specified in the instance document
     * or not.
     *
     * @param attrIndex The attribute index.
     * @param specified True if the attribute is specified in the instance
     *                  document.
     */
    func setSpecified(_ attrIndex : Int, _ specified : Bool)
    
    /**
     * Returns true if the attribute is specified in the instance document.
     *
     * @param attrIndex The attribute index
     * @return true if the attribute is specified in the instance document
     */
    func isSpecified(_ attrIndex : Int) -> Bool
    
    
    /**
     * Look up an augmentation by attribute's index.
     *
     * @param attributeIndex The attribute index.
     * @return Augmentations
     */
    func getAugmentations (_ attributeIndex : Int) -> Augmentations
    
    /**
     * Look up an augmentation by namespace name.
     *
     * @param uri       The Namespace URI, or the empty string if
     *                  the name has no Namespace URI.
     * @param localPart The attribute's local name
     * @return Augmentations
     */
    func getAugmentations (_ uri : String, _ localPart : String) -> Augmentations
    
    
    /**
     * Look up an augmentation by XML 1.0 qualified name.
     *
     * @param qName the XML 1.0 qualified name
     *
     * @return Augmentations
     */
    func getAugmentations(_ qName : String) -> Augmentations
    
    
    /**
     * Sets the augmentations of the attribute at the specified index.
     *
     * @param attrIndex The attribute index.
     * @param augs      The augmentations.
     */
    func setAugmentations(_ attrIndex : Int, _ augs : Augmentations);
    
    
  }
}
