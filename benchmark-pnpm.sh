 #!/bin/bash
#  

# 

echo -- INICIANDO BENCHMARK CLEAN pnpm install --

for i in {1..100}
do
    # Borramos la caché nativa de npm
    if [ -d  ./.npm/ ];then
        rm  -r ./.npm/
    fi

    # Borramos la caché de pnpm
    if [ -d  ./.cache/pnpm/ ];then
        rm  -r ./.cache/pnpm/
    fi

    # Borramos la caché de pnpm 2
    if [ -d  ./.local/share/pnpm/store/ ];then
        rm  -r ./.local/share/pnpm/store/
    fi

    # Borramos el node modules
    if [ -d  ./npm-benchmark/node_modules/ ];then
        rm  -r ./npm-benchmark/node_modules/
    fi

    cd ./npm-benchmark

    { time pnpm install >/dev/null; } 2>&1 | grep real >> clean-pnpm-install.bench
    
    cd ..

done



echo -- INICIANDO BENCHMARK UNCLEAN pnpm install --

for i in {1..100}
do
    # Borramos la caché nativa de npm
    if [ -d  ./.npm/ ];then
        rm  -r ./.npm/
    fi

    # Borramos la caché de pnpm
    if [ -d  ./.cache/pnpm/ ];then
        rm  -r ./.cache/pnpm/
    fi

    # Borramos la caché de pnpm 2
    if [ -d  ./.local/share/pnpm/store/ ];then
        rm  -r ./.local/share/pnpm/store/
    fi

    cd ./npm-benchmark

    { time pnpm install >/dev/null; } 2>&1 | grep real >> unclean-pnpm-install.bench
    
    cd ..

done

