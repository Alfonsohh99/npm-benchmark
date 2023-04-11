 #!/bin/bash
#  

# 

echo -- INICIANDO BENCHMARK CLEAN yarn install --

for i in {1..100}
do
    # Borramos la caché nativa de npm
    if [ -d  ./.npm/ ];then
        rm  -r ./.npm/
    fi

    # Borramos la caché nativa de yarn
    if [ -d  ./.yarn/ ];then
        rm  -r ./.yarn/
    fi

    # Borramos el node modules
    if [ -d  ./npm-benchmark/node_modules/ ];then
        rm  -r ./npm-benchmark/node_modules/
    fi

    # Borramos el .yarn del proyecto
    if [ -d  ./npm-benchmark/.yarn/ ];then
        rm  -r ./npm-benchmark/.yarn/
    fi

    cd ./npm-benchmark

    { time yarn install >/dev/null; } 2>&1 | grep real >> clean-yarn-install.bench
    
    cd ..

done

echo -- INICIANDO BENCHMARK CLEAN yarn install --prefer-offline --

for i in {1..100}
do
    # Borramos la caché nativa de npm
    if [ -d  ./.npm/ ];then
        rm  -r ./.npm/
    fi

    # Borramos el node modules
    if [ -d  ./npm-benchmark/node_modules/ ];then
        rm  -r ./npm-benchmark/node_modules/
    fi

    cd ./npm-benchmark

    { time yarn install --prefer-offline >/dev/null; } 2>&1 | grep real >> clean-yarn-install-po.bench
    
    cd ..

done


echo -- INICIANDO BENCHMARK UNCLEAN yarn install --

for i in {1..100}
do
    # Borramos la caché nativa de npm
    if [ -d  ./.npm/ ];then
        rm  -r ./.npm/
    fi

    cd ./npm-benchmark

    { time yarn install >/dev/null; } 2>&1 | grep real >> unclean-yarn-install.bench
    
    cd ..

done


echo -- INICIANDO BENCHMARK UNCLEAN yarn install --prefer-offline --

for i in {1..100}
do
    # Borramos la caché nativa de npm
    if [ -d  ./.npm/ ];then
        rm  -r ./.npm/
    fi

    cd ./npm-benchmark

    { time yarn install --prefer-offline >/dev/null; } 2>&1 | grep real >> unclean-yarn-install-po.bench
    
    cd ..

done

