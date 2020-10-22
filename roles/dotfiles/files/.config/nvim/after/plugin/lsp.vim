let g:completion_matching_strategy_list = ['exact','substring', 'fuzzy']
let g:completion_matching_smart_case = 1

" Diagnostics
let g:diagnostic_enable_underline = 1
let g:diagnostic_insert_delay = 0

call sign_define("LspDiagnosticsErrorSign", {"text" : "", "texthl" : "LspDiagnosticsError"})
call sign_define("LspDiagnosticsWarningSign", {"text" : "", "texthl" : "LspDiagnosticsWarning"})
call sign_define("LspDiagnosticsInformationSign", {"text" : "", "texthl" : "LspDiagnosticsInformation"})
call sign_define("LspDiagnosticsHintSign", {"text" : "ﯧ", "texthl" : "LspDiagnosticsHint"})
