local view, colors, styles=view, lexer.colors, lexer.styles

colors.true_black=0x000000
colors.black=0x40342e
colors.light_black=0x52423b
colors.grey=0x5e4c43
colors.light_grey=0x6a564c

colors.white=0xe9ded8
colors.whiter=0xf0e9e5
colors.whitest=0xf4efec

colors.tosca=0xbbbc8f
colors.cyan=0xd0c088
colors.blue_grey=0xc1a181
colors.blue=0xac815e

colors.red=0x6a61bf
colors.orange=0x7087d0
colors.yellow=0x8bcbeb
colors.green=0x8cbea3
colors.purple=0xad8eb4

-- Predefined styles.
styles.default={font='Cartograph CF', size=10, fore=colors.white, back=colors.black}
styles.line_number={fore=colors.tosca, back=colors.light_black}
--styles.control_char =
styles.indent_guide={fore=colors.light_black}
styles.call_tip={fore=colors.tosca, back=colors.light_black}
styles.fold_display_text={fore=colors.tosca}

-- Token styles.
styles.class={fore=colors.blue}
styles.comment={fore=colors.true_black, back=colors.light_grey}
styles.constant={fore=colors.red}
styles.embedded={fore=colors.purple, back=colors.true_black}
styles.error={fore=colors.white, back=colors.red, italics=true}
styles['function']={fore=colors.yellow, italics=true}
styles.identifier={}
styles.keyword={fore=colors.cyan}
styles.label={fore=colors.orange}
styles.number={fore=colors.red}
styles.operator={fore=colors.green}
styles.preprocessor={fore=colors.purple}
styles.regex={fore=colors.green}
styles.string={fore=colors.red}
styles.type={fore=colors.cyan}
styles.variable={fore=colors.blue}
styles.whitespace={}

styles.bracelight={fore=colors.whitest, back=colors.green}
styles.bracebad={fore=colors.whitest, back=colors.red, italics=true}

-- Multiple Selection and Virtual Space
--view.additional_sel_alpha =
--view.additional_sel_fore =
--view.additional_sel_back =
--view.additional_caret_fore =

-- Caret and Selection Styles.
-- Selection Style
view:set_sel_fore(true, colors.whitest)
view:set_sel_back(true, colors.orange)
-- view.sel_alpha=100
-- Current line Style
view.caret_fore=colors.tosca
view.caret_line_back=colors.tosca
view.caret_line_back_alpha=25

-- Fold Margin.
view:set_fold_margin_color(true, colors.black)
view:set_fold_margin_hi_color(true, colors.light_black)

-- Markers.
--view.marker_fore[textadept.bookmarks.MARK_BOOKMARK]=colors.black
view.marker_back[textadept.bookmarks.MARK_BOOKMARK]=colors.green
--view.marker_fore[textadept.run.MARK_WARNING]=colors.black
view.marker_back[textadept.run.MARK_WARNING]=colors.yellow
--view.marker_fore[textadept.run.MARK_ERROR]=colors.black
view.marker_back[textadept.run.MARK_ERROR]=colors.red
for i=buffer.MARKNUM_FOLDEREND, buffer.MARKNUM_FOLDEROPEN do -- fold margin
    view.marker_fore[i]=colors.black
    view.marker_back[i]=colors.tosca
    view.marker_back_selected[i]=colors.tosca
end

-- Indicators.
view.indic_fore[ui.find.INDIC_FIND]=colors.orange
view.indic_under[ui.find.INDIC_FIND]=true
view.indic_alpha[ui.find.INDIC_FIND]=128
view.indic_style[ui.find.INDIC_FIND]=view.INDIC_GRADIENT

view.indic_fore[textadept.editing.INDIC_BRACEMATCH]=colors.orange
view.indic_under[textadept.editing.INDIC_BRACEMATCH]=true
view.indic_alpha[textadept.editing.INDIC_BRACEMATCH]=128
view.indic_style[textadept.editing.INDIC_BRACEMATCH]=view.INDIC_GRADIENT

view.indic_fore[textadept.editing.INDIC_HIGHLIGHT]=colors.orange
view.indic_under[textadept.editing.INDIC_HIGHLIGHT]=true
view.indic_alpha[textadept.editing.INDIC_HIGHLIGHT]=128
view.indic_style[textadept.editing.INDIC_HIGHLIGHT]=view.INDIC_GRADIENT

view.indic_fore[textadept.snippets.INDIC_PLACEHOLDER]=colors.orange
view.indic_under[textadept.snippets.INDIC_PLACEHOLDER]=true
view.indic_alpha[textadept.snippets.INDIC_PLACEHOLDER]=128
view.indic_style[textadept.snippets.INDIC_PLACEHOLDER]=view.INDIC_GRADIENT

-- Call tips.
view.call_tip_fore_hlt=colors.tosca

-- Long Lines.
view.edge_color=colors.light_grey
