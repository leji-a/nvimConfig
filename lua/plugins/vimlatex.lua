return {
	'lervag/vimtex',
	ft = 'tex',
	config = function()
		-- Configuración del compilador
		vim.g.vimtex_compiler_latexmk = {
			executable = '/home/linuxbrew/.linuxbrew/bin/latexmk',
			options = {
				'-pdf',
				'-verbose',
				'-file-line-error',
				'-synctex=1',
				'-interaction=nonstopmode',
			},
		}

		-- Configuración de visualización
		vim.g.vimtex_view_automatic = 0
		vim.g.vimtex_compiler_enabled = 1

		-- Función para abrir PDF (la que funcionaba)
		function OpenPDF()
			local pdf = vim.fn.expand('%:r') .. '.pdf'
			if vim.fn.filereadable(pdf) == 1 then
				vim.fn.jobstart({ 'xdg-open', pdf }, { detach = true })
				print("📄 Abriendo PDF: " .. pdf)
			else
				print("❌ No existe el PDF. Compila primero con <leader>ll")
			end
		end

		-- LIMPIEZA REAL: eliminar archivos manualmente
		function RealClean()
			local files = vim.fn.glob('*.{aux,bbl,blg,log,out,toc,fls,fdb_latexmk,synctex.gz}', false, true)
			for _, file in ipairs(files) do
				os.remove(file)
			end
			print("🧹 Archivos auxiliares eliminados: " .. #files)
		end

		-- Variable para controlar limpieza
		local should_clean = false

		-- Hook después de compilar
		vim.api.nvim_create_autocmd('User', {
			pattern = 'VimtexEventCompileSuccess',
			callback = function()
				if should_clean then
					RealClean()
					should_clean = false
				end
			end,
		})

		-- Compilar y limpiar
		function CompileWithClean()
			should_clean = true
			vim.cmd('VimtexCompile')
		end

		-- Limpiar manual
		function CleanFiles()
			RealClean()
		end

		-- Compilar, limpiar y abrir PDF
		function CompileCleanAndView()
			should_clean = true
			vim.cmd('VimtexCompile')
			vim.defer_fn(function()
				OpenPDF()
			end, 1500)
		end

		-- Recompilar desde cero
		function FullCleanCompile()
			RealClean()
			should_clean = true
			vim.cmd('VimtexCompile')
		end

		-- Atajos
		local opts = { noremap = true, silent = true }

		vim.keymap.set('n', '<leader>ll', CompileWithClean,
			vim.tbl_extend('keep', opts, { desc = "Compilar y limpiar" }))

		vim.keymap.set('n', '<leader>lv', OpenPDF,
			vim.tbl_extend('keep', opts, { desc = "Abrir PDF" }))

		vim.keymap.set('n', '<leader>lz', CompileCleanAndView,
			vim.tbl_extend('keep', opts, { desc = "Compilar, limpiar y abrir PDF" }))

		vim.keymap.set('n', '<leader>lc', CleanFiles,
			vim.tbl_extend('keep', opts, { desc = "Limpiar archivos" }))

		vim.keymap.set('n', '<leader>le', '<cmd>VimtexErrors<CR>',
			vim.tbl_extend('keep', opts, { desc = "Mostrar errores" }))

		print("🎉 LaTeX configurado - Usa <leader>lz para compilar y ver PDF")
	end,
}
