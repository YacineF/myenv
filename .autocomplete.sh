 depending on the value of _ARC_DEBUG.
# If ARGCOMPLETE_USE_TEMPFILES is set, use tempfiles for IPC.
__python_argcomplete_run() {
    if [[ -z "${ARGCOMPLETE_USE_TEMPFILES-}" ]]; then
        __python_argcomplete_run_inner "$@"
        return
    fi
    local tmpfile="$(mktemp)"
    _ARGCOMPLETE_STDOUT_FILENAME="$tmpfile" __python_argcomplete_run_inner "$@"
    local code=$?
    cat "$tmpfile"
    rm "$tmpfile"
    return $code
}

__python_argcomplete_run_inner() {
    if [[ -z "${_ARC_DEBUG-}" ]]; then
        "$@" 8>&1 9>&2 1>/dev/null 2>&1
    else
        "$@" 8>&1 9>&2 1>&9 2>&1
    fi
}

_python_argcomplete() {
    local IFS=$'\013'
    if [[ -n "${ZSH_VERSION-}" ]]; then
        local completions
        completions=($(IFS="$IFS" \
            COMP_LINE="$BUFFER" \
            COMP_POINT="$CURSOR" \
            _ARGCOMPLETE=1 \
            _ARGCOMPLETE_SHELL="zsh" \
            _ARGCOMPLETE_SUPPRESS_SPACE=1 \
            __python_argcomplete_run "${words[1]}") )
        _describe "${words[1]}" completions -o nosort
    else
        local SUPPRESS_SPACE=0
        if compopt +o nospace 2> /dev/null; then
            SUPPRESS_SPACE=1
        fi
        COMPREPLY=($(IFS="$IFS" \
            COMP_LINE="$COMP_LINE" \
            COMP_POINT="$COMP_POINT" \
            COMP_TYPE="$COMP_TYPE" \
            _ARGCOMPLETE_COMP_WORDBREAKS="$COMP_WORDBREAKS" \
            _ARGCOMPLETE=1 \
            _ARGCOMPLETE_SHELL="bash" \
            _ARGCOMPLETE_SUPPRESS_SPACE=$SUPPRESS_SPACE \
            __python_argcomplete_run "$1"))
        if [[ $? != 0 ]]; then
            unset COMPREPLY
        elif [[ $SUPPRESS_SPACE == 1 ]] && [[ "${COMPREPLY-}" =~ [=/:]$ ]]; then
            compopt -o nospace
        fi
    fi
}
if [[ -z "${ZSH_VERSION-}" ]]; then
    complete -o nospace -o default -o bashdefault -F _python_argcomplete nxc
    complete -o nospace -o default -o bashdefault -F _python_argcomplete certipy
    complete -o nospace -o default -o bashdefault -F _python_argcomplete addcomputer.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete atexec.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete changepasswd.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete dcomexec.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete describeTicket.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete dpapi.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete DumpNTLMInfo.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete esentutl.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete exchanger.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete findDelegation.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete GetADUsers.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete getArch.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete Get-GPPPassword.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete GetNPUsers.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete getPac.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete getST.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete getTGT.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete GetUserSPNs.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete goldenPac.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete karmaSMB.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete keylistattack.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete kintercept.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete lookupsid.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete machine_role.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete mimikatz.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete mqtt_check.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete mssqlclient.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete mssqlinstance.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete net.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete netview.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete ntfs-read.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete ntlmrelayx.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete ping6.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete ping.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete psexec.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete raiseChild.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete rbcd.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete rdp_check.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete registry-read.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete reg.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete rpcdump.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete rpcmap.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete sambaPipe.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete samrdump.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete secretsdump.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete services.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete smbclient.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete smbexec.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete smbrelayx.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete smbserver.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete ticketConverter.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete ticketer.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete tstool.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete wmiexec.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete wmipersist.py
    complete -o nospace -o default -o bashdefault -F _python_argcomplete wmiquery.py
else
    compdef _python_argcomplete nxc
    compdef _python_argcomplete certipy
    compdef _python_argcomplete addcomputer.py
    compdef _python_argcomplete atexec.py
    compdef _python_argcomplete changepasswd.py
    compdef _python_argcomplete dcomexec.py
    compdef _python_argcomplete describeTicket.py
    compdef _python_argcomplete dpapi.py
    compdef _python_argcomplete DumpNTLMInfo.py
    compdef _python_argcomplete esentutl.py
    compdef _python_argcomplete exchanger.py
    compdef _python_argcomplete findDelegation.py
    compdef _python_argcomplete GetADUsers.py
    compdef _python_argcomplete getArch.py
    compdef _python_argcomplete Get-GPPPassword.py
    compdef _python_argcomplete GetNPUsers.py
    compdef _python_argcomplete getPac.py
    compdef _python_argcomplete getST.py
    compdef _python_argcomplete getTGT.py
    compdef _python_argcomplete GetUserSPNs.py
    compdef _python_argcomplete goldenPac.py
    compdef _python_argcomplete karmaSMB.py
    compdef _python_argcomplete keylistattack.py
    compdef _python_argcomplete kintercept.py
    compdef _python_argcomplete lookupsid.py
    compdef _python_argcomplete machine_role.py
    compdef _python_argcomplete mimikatz.py
    compdef _python_argcomplete mqtt_check.py
    compdef _python_argcomplete mssqlclient.py
    compdef _python_argcomplete mssqlinstance.py
    compdef _python_argcomplete net.py
    compdef _python_argcomplete netview.py
    compdef _python_argcomplete ntfs-read.py
    compdef _python_argcomplete ntlmrelayx.py
    compdef _python_argcomplete ping6.py
    compdef _python_argcomplete ping.py
    compdef _python_argcomplete psexec.py
    compdef _python_argcomplete raiseChild.py
    compdef _python_argcomplete rbcd.py
    compdef _python_argcomplete rdp_check.py
    compdef _python_argcomplete registry-read.py
    compdef _python_argcomplete reg.py
    compdef _python_argcomplete rpcdump.py
    compdef _python_argcomplete rpcmap.py
    compdef _python_argcomplete sambaPipe.py
    compdef _python_argcomplete samrdump.py
    compdef _python_argcomplete secretsdump.py
    compdef _python_argcomplete services.py
    compdef _python_argcomplete smbclient.py
    compdef _python_argcomplete smbexec.py
    compdef _python_argcomplete smbrelayx.py
    compdef _python_argcomplete smbserver.py
    compdef _python_argcomplete ticketConverter.py
    compdef _python_argcomplete ticketer.py
    compdef _python_argcomplete tstool.py
    compdef _python_argcomplete wmiexec.py
    compdef _python_argcomplete wmipersist.py
    compdef _python_argcomplete wmiquery.py
fi
