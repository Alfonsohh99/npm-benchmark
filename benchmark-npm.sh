 #!/bin/bash
#  

# 

echo -- INICIANDO BENCHMARK CLEAN npm install --

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

    { time npm install >/dev/null; } 2>&1 | grep real >> clean-npm-install.bench
    
    cd ..

done


echo -- INICIANDO BENCHMARK CLEAN npm install --no-audit --

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

    { time npm install --no-audit >/dev/null; } 2>&1 | grep real >> clean-npm-install-na.bench
    
    cd ..

done


echo -- INICIANDO BENCHMARK CLEAN npm install --no-audit --prefer-offline --

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

    { time npm install --no-audit --prefer-offline >/dev/null; } 2>&1 | grep real >> clean-npm-install-na-po.bench
    
    cd ..

done



echo -- INICIANDO BENCHMARK CLEAN npm ci --

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

    { time npm ci >/dev/null; } 2>&1 | grep real >> clean-npm-ci.bench
    
    cd ..

done


echo -- INICIANDO BENCHMARK CLEAN npm ci --no-audit --

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

    { time npm ci --no-audit >/dev/null; } 2>&1 | grep real >> clean-npm-ci-na.bench
    
    cd ..

done


echo -- INICIANDO BENCHMARK CLEAN npm ci --no-audit --prefer-offline --

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

    { time npm ci --no-audit --prefer-offline >/dev/null; } 2>&1 | grep real >> clean-npm-ci-na-po.bench
    
    cd ..

done




echo -- INICIANDO BENCHMARK UNCLEAN npm install --

for i in {1..100}
do
    # Borramos la caché nativa de npm
    if [ -d  ./.npm/ ];then
        rm  -r ./.npm/
    fi

    cd ./npm-benchmark

    { time npm install >/dev/null; } 2>&1 | grep real >> unclean-npm-install.bench
    
    cd ..

done


echo -- INICIANDO BENCHMARK UNCLEAN npm install --no-audit --

for i in {1..100}
do
    # Borramos la caché nativa de npm
    if [ -d  ./.npm/ ];then
        rm  -r ./.npm/
    fi

    cd ./npm-benchmark

    { time npm install --no-audit >/dev/null; } 2>&1 | grep real >> unclean-npm-install-na.bench
    
    cd ..

done


echo -- INICIANDO BENCHMARK UNCLEAN npm install --no-audit --prefer-offline --

for i in {1..100}
do
    # Borramos la caché nativa de npm
    if [ -d  ./.npm/ ];then
        rm  -r ./.npm/
    fi

    cd ./npm-benchmark

    { time npm install --no-audit --prefer-offline >/dev/null; } 2>&1 | grep real >> unclean-npm-install-na-po.bench
    
    cd ..

done



echo -- INICIANDO BENCHMARK UNCLEAN npm ci --

for i in {1..100}
do
    # Borramos la caché nativa de npm
    if [ -d  ./.npm/ ];then
        rm  -r ./.npm/
    fi

    cd ./npm-benchmark

    { time npm ci >/dev/null; } 2>&1 | grep real >> unclean-npm-ci.bench
    
    cd ..

done


echo -- INICIANDO BENCHMARK UNCLEAN npm ci --no-audit --

for i in {1..100}
do
    # Borramos la caché nativa de npm
    if [ -d  ./.npm/ ];then
        rm  -r ./.npm/
    fi

    cd ./npm-benchmark

    { time npm ci --no-audit >/dev/null; } 2>&1 | grep real >> unclean-npm-ci-na.bench
    
    cd ..

done


echo -- INICIANDO BENCHMARK UNCLEAN npm ci --no-audit --prefer-offline --

for i in {1..100}
do
    # Borramos la caché nativa de npm
    if [ -d  ./.npm/ ];then
        rm  -r ./.npm/
    fi

    cd ./npm-benchmark

    { time npm ci --no-audit --prefer-offline >/dev/null; } 2>&1 | grep real >> unclean-npm-ci-na-po.bench
    
    cd ..

done
