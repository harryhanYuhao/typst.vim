vim9script 
import autoload '../autoload/utils.vim' as utils
var viewerOpened = 0

# note that global variable does not need to be declared.
g:typstCompileOnSave = 1
g:typstPdfViewer = "xdg-open"

def OpenViewer(timerId: number): void
	if ! viewerOpened
		viewerOpened = 1
		var name = $"{utils.localFileNamePdf}"
		# handling errors:
		if executable($"{g:typstPdfViewer}")
			silent exec $"!{g:typstPdfViewer} {name} &"
			echow $"Viewer Opened ({g:typstPdfViewer}) for {utils.localFileNamePdf}"
		else
			echoe $"Typst Plugin: executable for {g:typstPdfViewer} not found!"
		endif
	endif
	return
enddef

def Compile(): void
	var tmp = system($"typst compile {utils.localFileName}")
	if v:shell_error != 0
		echoe $"TYPST Plugin: Compilation Failed. Failed to exec \"typst compile {utils.localFileName}\""
	else
		echow $"{utils.localFileName} Compiled!"
	endif
enddef

def CompileViewOnBufWritePost(timerId: number)
	Compile()
	timer_start(0, 'OpenViewer')
enddef

au! BufWritePost *.typ {
	:silent vim9cmd timer_start(0, 'CompileViewOnBufWritePost')
}
