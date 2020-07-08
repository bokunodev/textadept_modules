-- Copyright 2007-2020 Mitchell mitchell.att.foicica.com. See LICENSE.
-- Dark theme for Textadept.
-- Contributions by Ana Balan.

local view = view
local property, property_int = view.property, view.property_int

--[[ Nord palette
  Polar Night
#2e3440
#3b4252
#434c5e
#4c566a
  Snow Storm
#d8dee9
#e5e9f0
#eceff4
  Frost
#8fbcbb
#88c0d0
#81a1c1
#5e81ac
  Aurora
#bf616a
#d08770
#ebcb8b
#a3be8c
#b48ead
]]

property["color.black"] = 0x40342e
property["color.black2"] = 0x52423b
property["color.grey"] = 0x5e4c43
property["color.grey2"] = 0x6a564c
--
property["color.white3"] = 0xe9ded8
property["color.white2"] = 0xf0e9e5
property["color.white"] = 0xf4efec
--
property["color.greenish_blue"] = 0xbbbc8f
property["color.cyan"] = 0xd0c088
property["color.blue2"] = 0xc1a181
property["color.blue"] = 0xac815e
--
property["color.red"] = 0x6a61bf
property["color.orange"] = 0x7087d0
property["color.yellow"] = 0x8bcbeb
property["color.green"] = 0x8cbea3
property["color.magenta"] = 0xad8eb4

-- Default font.
property['font'], property['fontsize'] = 'Cartograph CF', 10
if WIN32 then
  property['font'] = 'Courier New'
elseif OSX then
  property['font'], property['fontsize'] = 'Monaco', 12
end

-- Predefined styles.
property['style.default'] = 'font:$(font),size:$(fontsize),'..
                            'fore:$(color.white3),back:$(color.black)'
property['style.linenumber'] = 'fore:$(color.greenish_blue),back:$(color.black2)'
--property['style.controlchar'] =
property['style.indentguide'] = 'fore:$(color.grey2)'
property['style.calltip'] = 'fore:$(color.white3),back:$(color.black2)'
property['style.folddisplaytext'] = 'fore:$(color.black2)'

-- Token styles.
property['style.class'] = 'fore:$(color.blue)'
property['style.comment'] = 'fore:$(color.grey2)'
property['style.constant'] = 'fore:$(color.cyan)'
property['style.embedded'] = 'fore:$(color.grey2),back:$(color.blue2)'
property['style.error'] = 'fore:$(color.white),back:$(color.red),italics'
property['style.function'] = 'fore:$(color.orange)'
property['style.identifier'] = 'fore:$(color.white3)'
property['style.keyword'] = 'fore:$(color.magenta)'
property['style.label'] = 'fore:$(color.red),bold'
property['style.number'] = 'fore:$(color.cyan)'
property['style.operator'] = 'fore:$(color.green)'
property['style.preprocessor'] = 'fore:$(color.red),bold'
property['style.regex'] = 'fore:$(color.green)'
property['style.string'] = 'fore:$(color.yellow)'
property['style.type'] = 'fore:$(color.cyan),italics'
property['style.variable'] = 'fore:$(color.blue)'
property['style.whitespace'] = ''

-- Multiple Selection and Virtual Space
--view.additional_sel_alpha =
--view.additional_sel_fore =
--view.additional_sel_back =
--view.additional_caret_fore =

-- Caret and Selection Styles.
view:set_sel_fore(true, property_int['color.white3'])
view:set_sel_back(true, property_int['color.grey'])
--view.sel_alpha =
view.caret_fore = property_int['color.white']
view.caret_line_back = property_int['color.black']
--view.caret_line_back_alpha =

-- Fold Margin.
view:set_fold_margin_color(true, property_int['color.black'])
view:set_fold_margin_hi_color(true, property_int['color.black2'])

-- Markers.
local MARK_BOOKMARK = textadept.bookmarks.MARK_BOOKMARK
--view.marker_fore[MARK_BOOKMARK] = property_int['color.black']
view.marker_back[MARK_BOOKMARK] = property_int['color.blue']
--view.marker_fore[textadept.run.MARK_WARNING] = property_int['color.black']
view.marker_back[textadept.run.MARK_WARNING] = property_int['color.orange']
--view.marker_fore[textadept.run.MARK_ERROR] = property_int['color.black']
view.marker_back[textadept.run.MARK_ERROR] = property_int['color.red']
for i = buffer.MARKNUM_FOLDEREND, buffer.MARKNUM_FOLDEROPEN do -- fold margin
  view.marker_fore[i] = property_int['color.black']
  view.marker_back[i] = property_int['color.greenish_blue']
  view.marker_back_selected[i] = property_int['color.grey2']
end

-- Indicators.
view.indic_fore[ui.find.INDIC_FIND] = property_int['color.yellow']
view.indic_alpha[ui.find.INDIC_FIND] = 255
local INDIC_BRACEMATCH = textadept.editing.INDIC_BRACEMATCH
view.indic_fore[INDIC_BRACEMATCH] = property_int['color.grey2']
local INDIC_HIGHLIGHT = textadept.editing.INDIC_HIGHLIGHT
view.indic_fore[INDIC_HIGHLIGHT] = property_int['color.orange']
view.indic_alpha[INDIC_HIGHLIGHT] = 255
local INDIC_PLACEHOLDER = textadept.snippets.INDIC_PLACEHOLDER
view.indic_fore[INDIC_PLACEHOLDER] = property_int['color.grey']

-- Call tips.
view.call_tip_fore_hlt = property_int['color.blue2']

-- Long Lines.
view.edge_color = property_int['color.black2']

