minicondadirs=("$HOME/miniconda3" "/usr/local/miniconda3" "/opt/miniconda3")

FOUND_MINICONDA=0
for minicondadir in $minicondadirs; do
    if [[ -d "${minicondadir}/bin" ]]; then
        FOUND_MINICONDA=1
        break
    fi
done

if [[ $FOUND_MINICONDA -eq 0 ]]; then
    if (( $+commands[brew] )) && minicondadir="$(brew --prefix miniconda)"; then
        [[ -d "${minicondadir}/bin" ]] && FOUND_MINICONDA=1
    fi
fi

if [[ $FOUND_MINICONDA -eq 1 ]]; then
    export PATH="${minicondadir}/bin:$PATH"
else
fi

unset minicondadir minicondadirs FOUND_MINICONDA