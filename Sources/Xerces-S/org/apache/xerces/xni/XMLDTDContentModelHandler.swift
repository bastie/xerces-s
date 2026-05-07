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
   * The DTD content model handler interface defines callback methods
   * to report information items in DTD content models of an element
   * declaration. Parser components interested in DTD content model
   * information implement this interface and are registered as the DTD
   * content model handler on the DTD content model source.
   *
   * @see XMLDTDHandler
   *
   * @author Andy Clark, IBM
   *
   * @version $Id$
   */
  public protocol XMLDTDContentModelHandler {
    
    //
    // Constants
    //
    
    // separators
    
    /**
     * A choice separator for children and mixed content models. This separator is used
     * to specify that the allowed child is one of a collection.
     * <p>For example:</p>
     * <pre>
     * &lt;!ELEMENT elem (foo|bar)&gt;
     * &lt;!ELEMENT elem (foo|bar+)&gt;
     * &lt;!ELEMENT elem (foo|bar|baz)&gt;
     * &lt;!ELEMENT elem (#PCDATA|foo|bar)*&gt;
     * </pre>
     *
     * @see XMLDTDContentModelHandler#SEPARATOR_SEQUENCE
     */
    static var SEPARATOR_CHOICE : Int16 {get} //= 0;
    
    /**
     * A sequence separator for children content models. This separator is used to
     * specify that the allowed children must follow in the specified sequence.
     * <pre>
     * &lt;!ELEMENT elem (foo,bar)&gt;
     * &lt;!ELEMENT elem (foo,bar*)&gt;
     * &lt;!ELEMENT elem (foo,bar,baz)&gt;
     * </pre>
     *
     * @see XMLDTDContentModelHandler#SEPARATOR_CHOICE
     */
    static var SEPARATOR_SEQUENCE : Int16 {get}// = 1;
    
    // occurrence counts
    
    /**
     * This occurrence count limits the element, choice, or sequence in a children content
     * model to zero or one. In other words, the child is optional.
     * <p>For example:</p>
     * <pre>
     * &lt;!ELEMENT elem (foo?)&gt;
     * </pre>
     *
     * @see XMLDTDContentModelHandler#OCCURS_ZERO_OR_MORE
     * @see XMLDTDContentModelHandler#OCCURS_ONE_OR_MORE
     */
    static var OCCURS_ZERO_OR_ONE : Int16 {get}// = 2;
    
    /**
     * This occurrence count limits the element, choice, or sequence in a children content
     * model to zero or more. In other words, the child may appear an arbitrary number of
     * times, or not at all. This occurrence count is also used for mixed content models.
     * <p>For example:</p>
     * <pre>
     * &lt;!ELEMENT elem (foo*)&gt;
     * &lt;!ELEMENT elem (#PCDATA|foo|bar)*&gt;
     * </pre>
     *
     * @see XMLDTDContentModelHandler#OCCURS_ZERO_OR_ONE
     * @see XMLDTDContentModelHandler#OCCURS_ONE_OR_MORE
     */
    static var OCCURS_ZERO_OR_MORE : Int16 { get } // = 3;
    
    /**
     * This occurrence count limits the element, choice, or sequence in a children content
     * model to one or more. In other words, the child may appear an arbitrary number of
     * times, but must appear at least once.
     * <p>For example:</p>
     * <pre>
     * &lt;!ELEMENT elem (foo+)&gt;
     * </pre>
     *
     * @see XMLDTDContentModelHandler#OCCURS_ZERO_OR_ONE
     * @see XMLDTDContentModelHandler#OCCURS_ZERO_OR_MORE
     */
    static var OCCURS_ONE_OR_MORE : Int16 {get} // = 4
    
    //
    // XMLDTDContentModelHandler methods
    //
    
    /**
     * The start of a content model. Depending on the type of the content
     * model, specific methods may be called between the call to the
     * startContentModel method and the call to the endContentModel method.
     *
     * @param elementName the name of the element
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     */
    func startContentModel(_ elementName : String, _ augmentations : Augmentations)
    throws (XNIException)
    
    /**
     * A content model of ANY.
     *
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     *
     * @see XMLDTDContentModelHandler#empty
     * @see XMLDTDContentModelHandler#startGroup
     */
    func `any`(_ augmentations : Augmentations) throws (XNIException)
    
    /**
     * A content model of EMPTY.
     *
     * @throws XNIException thrown by handler to signal an error
     *
     * @param augmentations additional information that may include infoset augmentations
     *
     * @see XMLDTDContentModelHandler#any
     * @see XMLDTDContentModelHandler#startGroup
     */
    func empty(_ augmentations : Augmentations) throws (XNIException)
    
    /**
     * A start of either a mixed or children content model. A mixed content model will
     * immediately be followed by a call to the {@link #pcdata(Augmentations)} method.
     * A children content model will contain additional groups and/or elements.
     *
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     *
     * @see XMLDTDContentModelHandler#any
     * @see XMLDTDContentModelHandler#empty
     */
    func startGroup(_ augmentations : Augmentations) throws (XNIException)
    
    /**
     * The appearance of "#PCDATA" within a group signifying a mixed content model.
     * This method will be the first called following the content model's {@link #startGroup(Augmentations)}.
     *
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     *
     * @see XMLDTDContentModelHandler#startGroup
     */
    func pcdata(_ augmentations : Augmentations) throws (XNIException)
    
    /**
     * A referenced element in a mixed or children content model.
     *
     * @param elementName the name of the referenced element
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     */
    func element(_ elementName : String, _ augmentations : Augmentations)
    throws (XNIException)
    
    /**
     * The separator between choices or sequences of a mixed or children
     * content model.
     *
     * @param separator the type of children separator
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     *
     * @see XMLDTDContentModelHandler#SEPARATOR_CHOICE
     * @see XMLDTDContentModelHandler#SEPARATOR_SEQUENCE
     */
    func separator(_ separator : Int16, _ augmentations : Augmentations)
    throws (XNIException)
    
    /**
     * The occurrence count for a child in a children content model or
     * for the mixed content model group.
     *
     * @param occurrence the occurrence count for the last element or group
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     *
     * @see XMLDTDContentModelHandler#OCCURS_ZERO_OR_ONE
     * @see XMLDTDContentModelHandler#OCCURS_ZERO_OR_MORE
     * @see XMLDTDContentModelHandler#OCCURS_ONE_OR_MORE
     */
    func occurrence(_ occurrence : Int16, _ augmentations : Augmentations)
    throws (XNIException)
    
    /**
     * The end of a group for mixed or children content models.
     *
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     */
    func endGroup(_ augmentations : Augmentations) throws (XNIException)
    
    /**
     * The end of a content model.
     *
     * @param augmentations additional information that may include infoset augmentations
     *
     * @throws XNIException thrown by handler to signal an error
     */
    func endContentModel(_ augmentations : Augmentations) throws (XNIException)
    
    /**
     * Set content model source.
     *
     * @param source content model source
     * @see XMLDTDContentModelSource
     */
    func setDTDContentModelSource(_ source : org.apache.xerces.xni.parser.XMLDTDContentModelSource)
    
    /**
     * Get content model source.
     *
     * @return content model source
     * @see XMLDTDContentModelSource
     */
    func getDTDContentModelSource() -> org.apache.xerces.xni.parser.XMLDTDContentModelSource
    
  } // interface XMLDTDContentModelHandler
}

extension org.apache.xerces.xni.XMLDTDContentModelHandler {
  
  static var SEPARATOR_CHOICE : Int16 {0}
  
  static var SEPARATOR_SEQUENCE : Int16 {1}
  
  static var OCCURS_ZERO_OR_ONE : Int16 {2}
  
  static var OCCURS_ZERO_OR_MORE : Int16 {3}
  
  static var OCCURS_ONE_OR_MORE : Int16 {4}
  
}
