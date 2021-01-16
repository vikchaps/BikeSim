%
% Bicycle study on a segment
%
% v is a bicycle
% p is a mission

% André Greipel en 2018, lors du sprint final de la 6ème étape du Tour Down Under, le sprinteur allemand a atteint 1903 watts et une vitesse maximale de 76,8 km/h,
% pour une moyenne de 1326 watts sur toute la durée de son sprint victorieux. Tout cela après deux heures de course sur un circuit de 90 km dans Adélaïde

% 1km           pr     Cr      Sref  Cx    SCx     V      p  fps  Br     Force  Power  Temps   Energy
%               bars           m2          m2      km/h   %  rpm         daN    Watt   sec      Wh    a 
% VTT Rock 8.1  4.0    0.0060  0.60  0.70  0.39    31.0   0  79   44/14  2.3    194    116      6     a
% BMC GF01      5.0    0.0045  0.45  0.60  0.27    36.0   0  76   50/14  2.0    200    100      6     a
% BMC Aero      5.0    0.0045  0.45  0.57  0.24    37.2   0  79   50/14  1.9    200     97      5     a
% BMC SLR01     5.0    0.0045  0.45  0.60  0.27    36.0   0  76   50/14  2.0    200    100      6     a
% PodBike       7.0    0.0060  0.60  0.20  0.12    46.1   0  81   60/14  2.7    351     78      8     a

% Parcours 100km 0.0%       Ph+Pe  Pr+Pa+Pg+Pi  E=Eh+Eb+Es        Eh/d Ee/d Eb/d Es/d Ee/d/W   CO2
%                                               Wh                  Wh/km             Wh/km/kg g
% VAE D31 2.8h 36.1 km/h   200+60  46+214+0+0   721=555-444+610   5.5  1.7  -4.4 6.1  0.022    0.005
% Bike                    =  Orbea D31-11v-327% (M, Cr, SCx, Spv)   = (90.9, 0.0051, 0.35, 1.00) 
%                                               (N/n, fps, dev, Fp) = 40/12   82  7.33m 13.7daN

 % Bicycle choice
  v = dv_Piste;      % Piste
% v = dv_MyBMC;      % Road
% v = dv_VAE_D31;    % VAE Alu     + 40mm Schwalbe 1 pl  Ready  GRX       2999?
% v = dv_MyVTT_8p1;     % VTT
% v = dv_Kona_Unit_X    % VTT voyage
% v = dv_VTT();         % VTT 
% v = dv_Cyclist_Position();   % Studying cyclist position on his bike
% v = dv_VC2;
% v = dv_VC3;
% v = dv_VCC2;
% v = dv_VCC3;
% v = dv_MyTrike;
% v = dv_Suntrip;
% v = dv_Proto0;
% v = dv_MyVAECCS;
% v = dv_Podbike;
% v = dv_SolarBoost();
% v = dv_VAES();
% v = dv_MyFixie;
% v = dv_Thinbike;
% v = dv_VAE_M20; % Carbone + 28mm Mavic Yk 2 plx Aksium Ultegra   4499? 5599?
% v = dv_VAE_M30; % Carbone + 40mm Mavic Gr 2 plx Aksium 105       3799? 4699?
% v = dv_VAE_D31; % Alu     + 40mm Mavic Gr 2 plx Ready  105 2599? 2899? 3699?
% v = dv_VAE_M21; % Carbone + 40mm Mavic Gr 1 pl  Aksium Force 1   4499? 5599?
% v = dv_VAE_Dp2; % Alu     + 50mm Schwalbe 1 pl  Nexus 7v         2699?
% v = dv_Schin_Arthur;   % VAE sans vitesse à courroie 13.4kg
% v = dv_VAE_Angell;     % VAE sans vitesse à courroie 14kg

% v = dv_Gene_CroixdeFer;
% v = dv_Gene_Vagabond;
% v = dv_Gene_Fugio30;
% v = dv_BMC_AC_Sport_One;
% v = dv_BMC_AC_Cross_One;
% v = dv_BMC_Aero;
% v = dv_BMC_SLR;

% v = dv_308;
% v = dv_Tesla;

% Vehicle
% v.mv            = 60; % velo + moteur + solaire
% v.m             = v.mv + v.mc;
% Cyclist capacity
  v.Ph_target     = 1903;v.Pe = 0.0*v.Ph_target;v.Ph=v.Ph_target;
 v.fps_opt       =  120;      %
% v.Fmax          = 2*2.2;    % daN

% Parcours
 v.d =100000;v.h = 0.00*v.d; % Distance [m], D+[m] Perfo SolarBoost
% v.d =120000;v.h = 4500;     % Distance [m], D+[m] VTT Valsloppet 2j Ardèche 120km D+4500m Mai 2020
% v.d = 30000;v.h = 1341;     % Distance [m], D+[m] VTT GTJ Jura
% v.d = 71300;v.h = 2250;     % Distance [m], D+[m] VTT Vilard de Lans Juin 2020
% v.d =130000;v.h = 4000;     % Distance [m], D+[m] VTT 4j Ardèche https://www.raidvtt-ardeche.com/
% v.d =546000;v.h = 4160;     % Distance [m], D+[m] Collioure-Menton
% v.d =155000;v.h = 2474;     % Distance [m], D+[m] ST2020 V=20km/h Ed=2123Wh 13.7Wh/km
% v.d =145000;v.h = 2000;     % Distance [m], D+[m] ST2020 P. Plotzer Ed=1900Wh Es=2100Wh
% v.d =500000;v.h = 1000;     % Distance [m], D+[m]
% v.d =500000;v.h = 1000;     % Distance [m], D+[m]
%v.d =3000*1000;v.h = 25*1000; % Distance [m], D+[m] ST2020 JM. Dubouloz Es=27kWh soit 2.7 Litres d'essence / 3000km !
v.a =   0.0;     % Accélération

% Calcul portion parcours / bicycle at target power
% if v.h >=0
v          = Speed_of_Power   (v);    % Calcul Vitesse = f(P=P_target)
% else
%     v          = Speed_Zero_Power (v);    % Calcul Vitesse = f(P=0)
% end
v          = Braquet          (v);    % Calcul Braquet optimal / Parcours

dev     = pi*v.dia*v.plateau/v.pignon;
pente   = 100*v.h/v.d;
CO2     = 30*v.Ee/1e6;  % 30g/kWh CO2

% Data velo
fprintf('======================================================= \n');
fprintf(' Parcours  d=%5.0fkm D+=%4.0fm p=%4.1f%% t=%5.1fmin = %4.1fh V=%4.1f km/h \n',v.d/1000,v.h,pente,v.temps/60,v.temps/3600,v.V*3.6);
%fprintf(' Accélération            = %5.1f %s \n',v.a,'m2/s');
fprintf(' Ph+Pe                   = %3.0f %s (%3.0f + %3.0f)\n',v.P,'W',v.Ph,v.Pe);
fprintf(' Pr+Pa+Pg+Pi             = %3.0f + %3.0f + %3.0f + %3.0f (%3.0f%% %3.0f%% %3.0f%% %3.0f%%)  \n',v.Pr,v.Pa,v.Pg,v.Pi,v.Pr/v.P*100,v.Pa/v.P*100,v.Pg/v.P*100,v.Pi/v.P*100);
fprintf(' Eh+Eb+Es                = %5.0f Wh = %4.0f + %4.0f + %4.0f \n',v.Ee+v.Eh,v.Eh,v.Ee-v.Es,v.Es);
fprintf(' Eh/d                    = %5.1f %s \n',v.Eh/v.d*1000,'Wh/km');
fprintf(' Ee/d                    = %5.1f %s \n',v.Ee/v.d*1000,'Wh/km');
fprintf(' Eb/d                    = %5.1f %s \n',(v.Ee-v.Es)/v.d*1000,'Wh/km');
fprintf(' Es/d                    = %5.1f %s \n',v.Es/v.d*1000,'Wh/km');
fprintf(' Ee/d/W                  = %5.3f %s \n',v.Ee/v.d*1000/v.mc,'Wh/km/kg');
fprintf(' CO2 emissions           = %5.3f %s \n',CO2,'g');
fprintf('======================================================= \n');
fprintf(' Bike                    = %s  \n',v.name);
%fprintf(' Cyclist                = %4.1f %s \n',v.Ph/v.m,'W/kg');
fprintf(' Mbike + Mcyclist     M  = %4.1f + %4.1f %s \n',v.mv,v.mc,' kg ');
fprintf(' Rolling coef.        Cr = %5.4f  (%3.1f bars)\n',v.Crj,v.pneu);
fprintf(' Drag surface        SCx =  %4.3fm2 \n',v.S*v.Cx);
fprintf(' Reference surface     S =  %3.2fm2 \n',v.S);
fprintf(' Drag coefficient     Cx =  %3.2f   \n',v.Cx);
fprintf(' (M, Cr, SCx, Spv)       = (%3.1f, %5.4f, %3.2f, %3.2f) \n',v.m, v.Crj,v.S*v.Cx,v.PV);
fprintf('================================================================================== \n');
%fprintf(' Useful Power Ph+Pe      = %4.0f %s (%4.0f + %4.0f) \n',v.P,'W',v.Ph_target,v.Pe_target);
fprintf(' (N/n, fps, dev, Fp)     = %2.0f/%2.0f  %3.0f  %4.2f%s %4.1f%s\n',v.plateau,v.pignon,v.fps,dev,'m',v.Fp/10,'daN');
fprintf('================================================================================== \n');
fprintf(' Temps/ 200m             = %4.1f%s\n',200/v.V,'sec');
fprintf(' Temps/ 500m             = %4.1f%s\n',500/v.V,'sec');
fprintf(' Temps/4000m             = %4.1f%s\n',4000/v.V,'sec');
fprintf('================================================================================== \n');

% Vitesse, distance par tour de pédale = f(Br, rpm, d)
%[V , d] = fps(42,11,60,0.663) % Plateau 42, pignon 11, frequence 60 rpm, diamètre roue 26'


