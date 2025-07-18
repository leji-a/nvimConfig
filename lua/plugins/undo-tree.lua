return {
	"mbbill/undotree",
	config = function()
		vim.g.undotree_WindowLayout = 3
		vim.g.undotree_SetFocusWhenToggle = 1
		vim.g.undotree_SplitWidth = 50
		vim.g.undotree_DiffpanelHeight = 15
		vim.g.undotree_HighlightChangedText = 1
		vim.g.undotree_HighlightChangedWithSign = 1
	end,
}

--[[  ===== Marks ===== 
" >num< : The current state
" {num} : The next redo state
" [num] : The latest state
" =num= : The diff mark
"   s   : Saved states
"   S   : The last saved state
"   ===== Hotkeys =====
" <cr> : Move to the current state
" <2-LeftMouse> : Move to the current state
" u : Undo
" <c-r> : Redo
" < : Move to the previous saved state
" > : Move to the next saved state
" J : Move to the previous undo state
" K : Move to the next undo state
" M : Clear the diff marker
" = : Set the diff marker
" D : Toggle the diff panel
" T : Toggle relative timestamp
" C : Clear undo history (with confirmation)
" <tab> : Set Focus back to the editor
" q : Close undotree panel
" ? : Toggle quick help ]]
