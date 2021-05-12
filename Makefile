

backtest_1:
	pwd;. .env/bin/activate; freqtrade backtesting --strategy BinHV45 -c config_1.json --timerange=20200310-20210320

backtest_2:
	 pwd;. .env/bin/activate; freqtrade backtesting --strategy quickie -c config_5.json --timerange=20200326-20210329

#freqtrade trade --strategy MoniGoManiHyperStrategy -c config_5.json
#freqtrade trade --strategy BinHV45 -c config_5.json

backtest_15_dakikaliklar:
	pwd;. .env/bin/activate; freqtrade backtesting --strategy SuperTrend -c config_15.json --timerange=20200310-20210320



# yildizli strateji______________________________________
backtest_1_saat_original:
	pwd;. .env/bin/activate; freqtrade backtesting --strategy default -c config_1h_d.json --timerange=20210128-20210407
# deneme_scripti
backtest_1_saat_edited:
	pwd;. .env/bin/activate; freqtrade backtesting --strategy default1 -c config_1h_leverage.json --timerange=20210328-20210407
# 20210310-20210405_________________________________________________________________

# dump tarigleri 2018 in basi 2018 in sonnu______________________________________

backtest_1_saat_original_dusus:
	pwd;. .env/bin/activate; freqtrade backtesting --strategy default -c config_1h.json --timerange=20180110-20180920
# deneme_scripti
backtest_1_saat_edited_dusus:
	pwd;. .env/bin/activate; freqtrade backtesting --strategy tacticdelo -c config_1h_d.json --timerange=20180110-20180920

# dump tarigleri 2018 in basi 2018 in sonnu______________________________________



#### HYPER OPTIMIZATION ####__________________________________________________________
yenni:
	pwd;. .env/bin/activate; freqtrade hyperopt -c config_1h_leverage.json  --hyperopt-loss WinRatioAndProfitRatioLoss --spaces all -s MoniGoManiHyperStrategy1 -e 1000 --timerange 20210101-20210316

hyper_opt_dogrusu:
	pwd;. .env/bin/activate; freqtrade hyperopt -c config_1h_leverage.json --hyperopt-loss SortinoHyperOptLossDaily --spaces all -s MoniGoManiHyperStrategy1 -e 1000 --timerange 20210316-20210504
hyper_opts:
	pwd;. .env/bin/activate; freqtrade hyperopt -c config_1h_leverage.json -s tacticdelo --hyperopt tacticdeloHyperOpt --hyperopt-loss OnlyProfitHyperOptLoss -e 10000 --spaces default --timerange=20200307-20210407
hyper_opt_new:
	pwd;. .env/bin/activate; freqtrade hyperopt -j 16 --spaces all -e 2000  --timerange 20210112-20210501 --hyperopt-loss OnlyProfitHyperOptLoss -s MoniGoManiHyperStrategy -c config_1h_leverage.json
#### HYPER OPTIMIZATION ####__________________________________________________________


#### LOOK TO EPOCHES ####__________________________________________________________
# aktif olan strategy_MoniGoManiHyperStrategy_hyperopt_results_2021-04-26_23-21-50.pickle  # en iyi sonuc veren
# son test ettigim strategy_MoniGoManiHyperStrategy1_hyperopt_results_2021-05-04_02-49-45.pickle
hyperopt_look_again:
	pwd;. .env/bin/activate; freqtrade hyperopt-show --best -n -2 --hyperopt-filename strategy_MoniGoManiHyperStrategy1_hyperopt_results_2021-05-06_07-53-56.pickle

#bakilacak

#pickles

# 321 %25
# 429 %3
# 445
# 481
# 515
# 562
# 574 %14
hyperopt_look_the_epoch:
	pwd;. .env/bin/activate; freqtrade hyperopt-show -n 64 --hyperopt-filename strategy_MoniGoManiHyperStrategy1_hyperopt_results_2021-05-06_07-53-56.pickle

# 614
# 607
# 525
# 467

hyperopt_look_to_list:
	pwd;. .env/bin/activate; freqtrade hyperopt-list --hyperopt-filename strategy_MoniGoManiHyperStrategy1_hyperopt_results_2021-05-06_07-53-56.pickle
#### LOOK TO EPOCHES ####__________________________________________________________


#### TEST CASES ####__________________________________________________________
MoniGoManiHyperStrategy_birincipart:
	pwd;. .env/bin/activate; freqtrade backtesting --strategy MoniGoManiHyperStrategy1 -c config_1h_leverage.json --timerange=20210101-20210316 #--export trades

MoniGoManiHyperStrategy_ikincipart:
	pwd;. .env/bin/activate; freqtrade backtesting --strategy MoniGoManiHyperStrategy1 -c config_1h_leverage.json --timerange=20210325-20210504 #--export trades
#bitis 20210413  baslangic 20210416  #sikinti 15 inde

# dump hyperopt scnerios

# STRATEJILER
# MoniGoManiHyperStrategy_back
# MoniGoManiHyperStrategy1

# CONFIGLER
#   config_1h_pozitif.json
#   config_1h_leverage.json

#### TEST CASES ####__________________________________________________________

grafige_bak:
	pwd;. .env/bin/activate; freqtrade plot-dataframe --strategy MoniGoManiHyperStrategy_back -p BNBUP/USDT -c config_1h_pozitif.json --timerange 20210416-20210501

open_the_html:
	open /Users/ilkedelandcaglar/Downloads/freqtrade-develop_V1/user_data/plot/freqtrade-plot-BNBUP_USDT-15m.html


backtest_6:
	pwd;. .env/bin/activate; freqtrade backtesting --strategy ADX_15M_USDT -c config_15.json

data_indir_5:
	pwd;. .env/bin/activate;  freqtrade download-data --days 360 -t 1m -c config_1h_leverage.json

data_indir_15:
	pwd;. .env/bin/activate;  freqtrade download-data --days 20 -t 15m -c config_1h_leverage.json

data_indir_1h:
	pwd;. .env/bin/activate;  freqtrade download-data --days 390 -t 1h -c config_1h_leverage.json

data_indir_4h:
	pwd;. .env/bin/activate;  freqtrade download-data --days 360 -t 4h

yeni_strateji_yarat:
	pwd;. .env/bin/activate;  freqtrade new-strategy --strategy AwesomeStrategy

konfigurasyonla_calistir_yarat:
	pwd;. .env/bin/activate;  freqtrade trade -c config.json
# database e konfigurasyonu optimize etmeyi unutma

help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

# Virtual Environment Related


activate-virtual-environment:
	pwd;.  venv/bin/activate; pwd; cd todo; pwd;  python manage.py runserver; cd ..; pwd

refresh_react:
	cd todo; cd my-app; npm run build; cd ..; cd ..; pwd;

run_sever:
	cd todo; python manage.py runserver; cd..; pwd;


activate-virtual-environment_orn:
	( \
       source path/to/virtualenv/bin/activate; \
       pip install -r requirements.txt; \
    )

activate-virtual-environment_orn1:
	( \
       SHELL := /bin/bash; \
       source ./venv/bin/activate; \
    )

refresh_all:
	cd todo; cd my-app; npm run build; cd ..; cd ..; pwd; .  venv/bin/activate; pwd; cd todo; pwd;  python manage.py collectstatic; cd ..; pwd; cd todo; pwd;  python manage.py runserver 0.0.0.0:80; cd ..; pwd


# Python Related





# React Related





# Requrements Related