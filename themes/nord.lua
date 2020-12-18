local view,styles=view,lexer.styles

color={
    ["black"]      =0x40342e,
    ["lightblack"] =0x52423b,
    ["grey"]       =0x5e4c43,
    ["lightgrey"]  =0x6a564c,

    ["smoke"] =0xe9ded8,
    ["snow"]  =0xf0e9e5,
    ["white"] =0xf4efec,

    ["tosca"]  =0xbbbc8f,
    ["cyan"]   =0xd0c088,
    ["bluish"] =0xc1a181,
    ["blue"]   =0xac815e,

    ["red"]     =0x6a61bf,
    ["orange"]  =0x7087d0,
    ["yellow"]  =0x8bcbeb,
    ["green"]   =0x8cbea3,
    ["magenta"] =0xad8eb4,

    ["pitchblack"]=0x000000,
}


styles["default"]={font='Cartograph CF', size=10,fore=color.snow,back=color.black}
styles["line_number"]={fore=color.tosca,back=color.lightblack}
styles["control_char"]={fore=color.red,back=color.red}
styles["indent_guide"]={fore=color.lightgrey}
styles["call_tip"]={fore=color.tosca,back=color.lightblack}
--styles["fold_display_text"]

styles["keyword"]={fore=color.blue,bold=true}
styles["constant"]={fore=color.red}
styles["type"]={fore=color.orange}
styles["function"]={fore=color.yellow,italics=true}
styles["identifier"]={fore=color.snow,back=color.black}
styles["comment"]={fore=color.pitchblack,back=color.lightgrey}
styles["embedded"]={fore=color.pitchblack,back=color.lightgrey}
styles["operator"]={fore=color.green}
styles["variable"]={fore=color.orange}
styles["class"]={fore=color.bluish}
styles["error"]={fore=color.white,back=color.red,italics=true}
--styles["label"]
styles["number"]={fore=color.red}
styles["preprocessor"]={fore=color.magenta,bold=true}
styles["string"]={fore=color.red}
styles["regex"]={fore=color.red}
--styles["whitespace"]

styles.bracelight={fore=color.white, back=color.green}
styles.bracebad={fore=color.white, back=color.red, italics=true}

view.caret_style = view.CARETSTYLE_LINE
view.caret_width = 2
view.caret_fore = color.tosca
view.caret_line_back = color.lightblack

view:set_sel_fore(true, color.white)
view:set_sel_back(true, color.orange)

view:set_fold_margin_color(true, color.black)
view:set_fold_margin_hi_color(true, color.lightblack)

view.marker_fore[textadept.bookmarks.MARK_BOOKMARK]=color.green
view.marker_back[textadept.bookmarks.MARK_BOOKMARK]=color.green
view.marker_fore[textadept.run.MARK_WARNING]=color.yellow
view.marker_back[textadept.run.MARK_WARNING]=color.yellow
view.marker_fore[textadept.run.MARK_ERROR]=color.red
view.marker_back[textadept.run.MARK_ERROR]=color.red

for i=buffer.MARKNUM_FOLDEREND, buffer.MARKNUM_FOLDEROPEN do
    view.marker_fore[i]=color.black
    view.marker_back[i]=color.tosca
    view.marker_back_selected[i]=color.tosca
end

view.indic_fore[ui.find.INDIC_FIND]=color.orange
view.indic_under[ui.find.INDIC_FIND]=true

view.indic_fore[textadept.editing.INDIC_BRACEMATCH]=color.orange
view.indic_under[textadept.editing.INDIC_BRACEMATCH]=true

view.indic_fore[textadept.editing.INDIC_HIGHLIGHT]=color.orange
view.indic_under[textadept.editing.INDIC_HIGHLIGHT]=true

view.indic_fore[textadept.snippets.INDIC_PLACEHOLDER]=color.orange
view.indic_under[textadept.snippets.INDIC_PLACEHOLDER]=true

view.call_tip_use_style = view.STYLE_CALLTIP
