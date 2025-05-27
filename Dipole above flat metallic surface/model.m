function out = model
%
% model.m
%
% Model exported on Nov 25 2016, 21:11 by COMSOL 5.2.0.166.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('D:\Google Drive\PhD\Codes\COMSOL\Dipole above flat metallic surface');

model.comments(['Untitled\n\n']);

model.modelNode.create('comp1');

model.geom.create('geom1', 2);

model.mesh.create('mesh1', 'geom1');

model.physics.create('emw', 'ElectromagneticWaves', 'geom1');

model.study.create('std1');
model.study('std1').create('freq', 'Frequency');
model.study('std1').feature('freq').activate('emw', true);

model.geom('geom1').lengthUnit([native2unicode(hex2dec({'00' 'b5'}), 'unicode') 'in']);
model.geom('geom1').lengthUnit([native2unicode(hex2dec({'00' 'b5'}), 'unicode') 'm']);

model.param.set('ant_d', '10 [um]');
model.param.descr('ant_d', 'antenna diameter');
model.param.set('wl', '780 [nm]');
model.param.descr('wl', 'wavelength');
model.param.set('c', '2.99792e8 [m/s]');
model.param.rename('ant_d', 'ant_diam');
model.param.set('ant_diam', '10 [um]', 'antenna diameter');
model.param.rename('ant_diam', 'ant_d');
model.param.set('ant_d', '10 [um]', 'antenna diameter');
model.param.set('L_metal', '100 [nm]');
model.param.descr('L_metal', 'metal thickness');
model.param.set('L_wg', '300 [nm]');
model.param.descr('L_wg', 'waveguide thickness');
model.param.set('L_air', '2 [um]');
model.param.descr('L_air', 'air thickness');
model.param.set('L_PML', '1 [um]');
model.param.descr('L_PML', 'PML thickness');
model.param.set('L_sep', '1 [um]');

model.geom('geom1').run;
model.geom('geom1').create('sq1', 'Square');
model.geom('geom1').feature('sq1').label('metal');
model.geom('geom1').feature.remove('sq1');
model.geom('geom1').create('r1', 'Rectangle');
model.geom('geom1').feature('r1').label('metal');
model.geom('geom1').feature('r1').set('size', {'ant_d' 'L_metal'});
model.geom('geom1').feature('r1').set('pos', {'-ant_d/2' '-L_metal'});
model.geom('geom1').run('r1');
model.geom('geom1').run('r1');
model.geom('geom1').create('r2', 'Rectangle');
model.geom('geom1').feature('r2').label('wg_layer');
model.geom('geom1').feature('r2').set('size', {'ant_d' 'L_wg'});
model.geom('geom1').feature('r2').set('pos', {'-ant_d/2' '0'});
model.geom('geom1').run('r2');
model.geom('geom1').run('r2');
model.geom('geom1').create('r3', 'Rectangle');
model.geom('geom1').feature('r3').label('air_top');
model.geom('geom1').feature('r3').set('size', {'ant_d' 'L_air'});
model.geom('geom1').feature('r3').set('pos', {'-ant_d/2' 'L_wg'});
model.geom('geom1').run('r3');
model.geom('geom1').feature.duplicate('r4', 'r3');
model.geom('geom1').feature('r4').label('air_bot');
model.geom('geom1').feature('r4').set('pos', {'-ant_d/2' '-L_metal-L_air'});
model.geom('geom1').run('r4');
model.geom('geom1').run('r4');
model.geom('geom1').create('r5', 'Rectangle');
model.geom('geom1').feature('r5').label('sep_right');
model.geom('geom1').feature('r5').set('size', {'L_sep' '2*L_air+L_metal+L_wg'});
model.geom('geom1').run('r5');
model.geom('geom1').feature('r5').set('pos', {'ant_d/2' '-L_metal+L_air'});
model.geom('geom1').run('r5');
model.geom('geom1').feature('r5').set('pos', {'ant_d/2' '-L_metal-L_air'});
model.geom('geom1').run('r5');
model.geom('geom1').feature.duplicate('r6', 'r5');
model.geom('geom1').feature('r6').label('sep_left');
model.geom('geom1').feature('r6').setIndex('pos', '-ant_d/2-L_sep', 0);
model.geom('geom1').run('r6');
model.geom('geom1').run('r6');
model.geom('geom1').create('r7', 'Rectangle');
model.geom('geom1').feature('r7').label('PML_top');
model.geom('geom1').feature('r7').set('size', {'ant_d+2*L_sep' '1'});
model.geom('geom1').feature('r7').setIndex('size', 'L_PML', 1);
model.geom('geom1').feature('r7').set('pos', {'-ant_d/2-L_sep' '0'});
model.geom('geom1').feature('r7').setIndex('pos', 'L_wg+L_air', 1);
model.geom('geom1').run('r7');
model.geom('geom1').feature.duplicate('r8', 'r7');
model.geom('geom1').feature('r8').label('PML_bot');
model.geom('geom1').feature('r8').setIndex('pos', '-L_metal-L_air', 1);
model.geom('geom1').run('r8');
model.geom('geom1').feature('r8').setIndex('pos', '-L_metal-L_air-L_PML', 1);
model.geom('geom1').run('r8');
model.geom('geom1').feature.duplicate('r9', 'r8');
model.geom('geom1').feature('r9').label('PML_right');
model.geom('geom1').feature('r9').set('size', {'L_PML' '2*L_PML+2*L_air+L_metal+L_wg'});
model.geom('geom1').feature('r9').setIndex('pos', '-ant_d/2-L_sep-L_PML', 0);
model.geom('geom1').feature('r9').label('PML_left');
model.geom('geom1').run('r9');
model.geom('geom1').feature.duplicate('r10', 'r9');
model.geom('geom1').feature('r10').label('PML_right');
model.geom('geom1').feature('r10').setIndex('pos', 'ant_d/2+L_sep', 0);
model.geom('geom1').run('r10');
model.geom('geom1').run('r10');
model.geom('geom1').create('pt1', 'Point');

model.param.set('emm_height', '0.6*L_wg');
model.param.descr('emm_height', 'emitter height');
model.param.descr('L_sep', 'seperation layer thickness');

model.geom('geom1').feature('pt1').setIndex('p', 'emm_height', 1);
model.geom('geom1').run('pt1');
model.geom('geom1').run;

model.material.create('mat1', 'Common', 'comp1');
model.material('mat1').label('Air');
model.material('mat1').set('family', 'air');
model.material('mat1').propertyGroup('def').set('relpermeability', '1');
model.material('mat1').propertyGroup('def').set('relpermittivity', '1');
model.material('mat1').propertyGroup('def').set('dynamicviscosity', 'eta(T[1/K])[Pa*s]');
model.material('mat1').propertyGroup('def').set('ratioofspecificheat', '1.4');
model.material('mat1').propertyGroup('def').set('electricconductivity', '0[S/m]');
model.material('mat1').propertyGroup('def').set('heatcapacity', 'Cp(T[1/K])[J/(kg*K)]');
model.material('mat1').propertyGroup('def').set('density', 'rho(pA[1/Pa],T[1/K])[kg/m^3]');
model.material('mat1').propertyGroup('def').set('thermalconductivity', 'k(T[1/K])[W/(m*K)]');
model.material('mat1').propertyGroup('def').set('soundspeed', 'cs(T[1/K])[m/s]');
model.material('mat1').propertyGroup('def').func.create('eta', 'Piecewise');
model.material('mat1').propertyGroup('def').func('eta').set('funcname', 'eta');
model.material('mat1').propertyGroup('def').func('eta').set('arg', 'T');
model.material('mat1').propertyGroup('def').func('eta').set('extrap', 'constant');
model.material('mat1').propertyGroup('def').func('eta').set('pieces', {'200.0' '1600.0' '-8.38278E-7+8.35717342E-8*T^1-7.69429583E-11*T^2+4.6437266E-14*T^3-1.06585607E-17*T^4'});
model.material('mat1').propertyGroup('def').func.create('Cp', 'Piecewise');
model.material('mat1').propertyGroup('def').func('Cp').set('funcname', 'Cp');
model.material('mat1').propertyGroup('def').func('Cp').set('arg', 'T');
model.material('mat1').propertyGroup('def').func('Cp').set('extrap', 'constant');
model.material('mat1').propertyGroup('def').func('Cp').set('pieces', {'200.0' '1600.0' '1047.63657-0.372589265*T^1+9.45304214E-4*T^2-6.02409443E-7*T^3+1.2858961E-10*T^4'});
model.material('mat1').propertyGroup('def').func.create('rho', 'Analytic');
model.material('mat1').propertyGroup('def').func('rho').set('funcname', 'rho');
model.material('mat1').propertyGroup('def').func('rho').set('args', {'pA' 'T'});
model.material('mat1').propertyGroup('def').func('rho').set('expr', 'pA*0.02897/8.314/T');
model.material('mat1').propertyGroup('def').func('rho').set('dermethod', 'manual');
model.material('mat1').propertyGroup('def').func('rho').set('argders', {'pA' 'd(pA*0.02897/8.314/T,pA)'; 'T' 'd(pA*0.02897/8.314/T,T)'});
model.material('mat1').propertyGroup('def').func.create('k', 'Piecewise');
model.material('mat1').propertyGroup('def').func('k').set('funcname', 'k');
model.material('mat1').propertyGroup('def').func('k').set('arg', 'T');
model.material('mat1').propertyGroup('def').func('k').set('extrap', 'constant');
model.material('mat1').propertyGroup('def').func('k').set('pieces', {'200.0' '1600.0' '-0.00227583562+1.15480022E-4*T^1-7.90252856E-8*T^2+4.11702505E-11*T^3-7.43864331E-15*T^4'});
model.material('mat1').propertyGroup('def').func.create('cs', 'Analytic');
model.material('mat1').propertyGroup('def').func('cs').set('funcname', 'cs');
model.material('mat1').propertyGroup('def').func('cs').set('args', {'T'});
model.material('mat1').propertyGroup('def').func('cs').set('expr', 'sqrt(1.4*287*T)');
model.material('mat1').propertyGroup('def').func('cs').set('dermethod', 'manual');
model.material('mat1').propertyGroup('def').func('cs').set('argders', {'T' 'd(sqrt(1.4*287*T),T)'});
model.material('mat1').propertyGroup('def').addInput('temperature');
model.material('mat1').propertyGroup('def').addInput('pressure');
model.material('mat1').propertyGroup.create('RefractiveIndex', 'Refractive index');
model.material('mat1').propertyGroup('RefractiveIndex').set('n', '1');
model.material('mat1').set('family', 'air');
model.material('mat1').selection.set([3 5 8 9]);

model.coordSystem.create('pml1', 'geom1', 'PML');
model.coordSystem('pml1').selection.set([1 2 4 10]);

model.material.create('mat2', 'Common', 'comp1');
model.material('mat2').label('pmma resists (Microchem 495)');
model.material('mat2').propertyGroup.create('RefractiveIndex', 'Refractive index');
model.material('mat2').propertyGroup('RefractiveIndex').set('n', 'n_interp(1[1/m]*c_const/freq)');
model.material('mat2').propertyGroup('RefractiveIndex').set('ki', 'k_interp(1[1/m]*c_const/freq)');
model.material('mat2').propertyGroup('RefractiveIndex').func.create('n_interp', 'Interpolation');
model.material('mat2').propertyGroup('RefractiveIndex').func('n_interp').set('sourcetype', 'user');
model.material('mat2').propertyGroup('RefractiveIndex').func('n_interp').set('source', 'table');
model.material('mat2').propertyGroup('RefractiveIndex').func('n_interp').set('funcname', 'n_interp');
model.material('mat2').propertyGroup('RefractiveIndex').func('n_interp').set('table', {'2.0E-7' '1.6903625';  ...
'2.09E-7' '1.6647891063220162';  ...
'2.1800000000000002E-7' '1.643650024606087';  ...
'2.27E-7' '1.6260123433255185';  ...
'2.36E-7' '1.6111691987636583';  ...
'2.4500000000000004E-7' '1.598578575565748';  ...
'2.5399999999999997E-7' '1.587820256043637';  ...
'2.63E-7' '1.578565105787824';  ...
'2.72E-7' '1.5705528723221558';  ...
'2.8100000000000004E-7' '1.5635759412854022';  ...
'2.9000000000000003E-7' '1.5574673163848598';  ...
'2.99E-7' '1.5520916304765275';  ...
'3.0800000000000006E-7' '1.5473383566872636';  ...
'3.17E-7' '1.5431166334071287';  ...
'3.26E-7' '1.5393512850128022';  ...
'3.35E-7' '1.5359797368593044';  ...
'3.44E-7' '1.532949605011377';  ...
'3.53E-7' '1.5302167993364248';  ...
'3.6200000000000004E-7' '1.5277440202667643';  ...
'3.71E-7' '1.525499559705741';  ...
'3.8000000000000007E-7' '1.523456338579354';  ...
'3.89E-7' '1.5215911297556524';  ...
'3.98E-7' '1.5198839270955071';  ...
'4.0700000000000003E-7' '1.5183174304059124';  ...
'4.16E-7' '1.5168766228543047';  ...
'4.25E-7' '1.515548422552412';  ...
'4.3400000000000005E-7' '1.5143213939517601';  ...
'4.4300000000000004E-7' '1.5131855077165541';  ...
'4.5199999999999997E-7' '1.5121319400778284';  ...
'4.6100000000000006E-7' '1.5111529044914045';  ...
'4.7E-7' '1.5102415098445987';  ...
'4.790000000000001E-7' '1.5093916405750327';  ...
'4.88E-7' '1.5085978549488257';  ...
'4.970000000000001E-7' '1.5078552984474065';  ...
'5.06E-7' '1.5071596297723566';  ...
'5.150000000000002E-7' '1.5065069574266594';  ...
'5.24E-7' '1.505893785192221';  ...
'5.33E-7' '1.5053169651157359';  ...
'5.420000000000001E-7' '1.504773656852197';  ...
'5.510000000000001E-7' '1.5042612924086414';  ...
'5.6E-7' '1.503777545488859';  ...
'5.690000000000001E-7' '1.503320304769587';  ...
'5.78E-7' '1.5028876505456752';  ...
'5.87E-7' '1.5024778342701082';  ...
'5.960000000000001E-7' '1.5020892605881029';  ...
'6.05E-7' '1.501720471525507';  ...
'6.140000000000001E-7' '1.5013701325426467';  ...
'6.23E-7' '1.501037020207402';  ...
'6.32E-7' '1.5007200112770627';  ...
'6.41E-7' '1.5004180730086623';  ...
'6.500000000000001E-7' '1.5001302545429083';  ...
'6.59E-7' '1.4998556792283626';  ...
'6.68E-7' '1.4995935377707965';  ...
'6.77E-7' '1.4993430821081788';  ...
'6.860000000000002E-7' '1.4991036199250238';  ...
'6.95E-7' '1.4988745097311422';  ...
'7.04E-7' '1.4986551564395547';  ...
'7.130000000000001E-7' '1.4984450073866602';  ...
'7.220000000000001E-7' '1.4982435487449257';  ...
'7.310000000000001E-7' '1.4980503022845473';  ...
'7.4E-7' '1.497864822445884';  ...
'7.49E-7' '1.4976866936890867';  ...
'7.580000000000002E-7' '1.4975155280913701';  ...
'7.670000000000001E-7' '1.4973509631658564';  ...
'7.76E-7' '1.4971926598789673';  ...
'7.850000000000001E-7' '1.4970403008459883';  ...
'7.94E-7' '1.496893588686751';  ...
'8.030000000000001E-7' '1.4967522445254036';  ...
'8.12E-7' '1.4966160066200245';  ...
'8.210000000000002E-7' '1.4964846291093934';  ...
'8.3E-7' '1.4963578808656126';  ...
'8.390000000000001E-7' '1.4962355444424806';  ...
'8.480000000000001E-7' '1.4961174151105896';  ...
'8.569999999999999E-7' '1.4960032999710688';  ...
'8.66E-7' '1.495893017140726';  ...
'8.750000000000002E-7' '1.4957863950020824';  ...
'8.84E-7' '1.4956832715124617';  ...
'8.93E-7' '1.4955834935668677';  ...
'9.020000000000001E-7' '1.4954869164099185';  ...
'9.109999999999999E-7' '1.4953934030925569';  ...
'9.200000000000001E-7' '1.4953028239696828';  ...
'9.29E-7' '1.4952150562352153';  ...
'9.380000000000002E-7' '1.4951299834914258';  ...
'9.470000000000002E-7' '1.4950474953496853';  ...
'9.56E-7' '1.4949674870600236';  ...
'9.65E-7' '1.4948898591671496';  ...
'9.74E-7' '1.49481451719079';  ...
'9.83E-7' '1.4947413713283937';  ...
'9.920000000000002E-7' '1.4946703361784321';  ...
'1.001E-6' '1.4946013304826775';  ...
'1.0100000000000003E-6' '1.494534276885979';  ...
'1.0190000000000001E-6' '1.4944691017121934';  ...
'1.028E-6' '1.4944057347550357';  ...
'1.0370000000000002E-6' '1.4943441090827232';  ...
'1.046E-6' '1.4942841608553805';  ...
'1.055E-6' '1.4942258291542585';  ...
'1.064E-6' '1.4941690558219025';  ...
'1.0730000000000001E-6' '1.4941137853124689';  ...
'1.082E-6' '1.4940599645514616';  ...
'1.0910000000000002E-6' '1.4940075428042123';  ...
'1.1E-6' '1.4939564715524898'});
model.material('mat2').propertyGroup('RefractiveIndex').func('n_interp').set('interp', 'piecewisecubic');
model.material('mat2').propertyGroup('RefractiveIndex').func('n_interp').set('extrap', 'const');
model.material('mat2').propertyGroup('RefractiveIndex').func.create('k_interp', 'Interpolation');
model.material('mat2').propertyGroup('RefractiveIndex').func('k_interp').set('sourcetype', 'user');
model.material('mat2').propertyGroup('RefractiveIndex').func('k_interp').set('source', 'table');
model.material('mat2').propertyGroup('RefractiveIndex').func('k_interp').set('funcname', 'k_interp');
model.material('mat2').propertyGroup('RefractiveIndex').func('k_interp').set('table', {'2.0E-7' '0.0'; '6.500000000000001E-7' '0.0'; '1.1E-6' '0.0'});
model.material('mat2').propertyGroup('RefractiveIndex').func('k_interp').set('interp', 'piecewisecubic');
model.material('mat2').propertyGroup('RefractiveIndex').func('k_interp').set('extrap', 'const');
model.material('mat2').propertyGroup('RefractiveIndex').addInput('frequency');
model.material('mat2').selection.set([7]);
model.material('mat2').propertyGroup('def').set('relpermittivity', {'(n_interp(1[1/m]*c_const/freq))^2+(k_interp(1[1/m]*c_const/freq))^2'});

model.param.set('e_PMMA', '(0)+(k_interp(1[1/m]*c_const/freq))+2*j');
model.param.remove('e_PMMA');

model.material('mat2').propertyGroup('def').set('electricconductivity', {'0'});
model.material('mat2').propertyGroup('def').set('relpermeability', {'1'});
model.material('mat2').propertyGroup('def').set('relpermittivity', {'(n_interp(1[1/m]*c_const/freq))^2+(k_interp(1[1/m]*c_const/freq))^2+2*j*n_interp(1[1/m]*c_const/freq)*k_interp(1[1/m]*c_const/freq)'});
model.material.create('mat3', 'Common', 'comp1');
model.material('mat3').label('Silver [solid]');
model.material('mat3').set('family', 'custom');
model.material('mat3').set('lighting', 'cooktorrance');
model.material('mat3').set('specular', 'custom');
model.material('mat3').set('customspecular', [0.7843137254901961 1 1]);
model.material('mat3').set('fresnel', 0.9);
model.material('mat3').set('roughness', 0.1);
model.material('mat3').set('shininess', 200);
model.material('mat3').propertyGroup('def').set('dL', '(dL(T[1/K])-dL(Tempref[1/K]))/(1+dL(Tempref[1/K]))');
model.material('mat3').propertyGroup('def').set('CTE', 'CTE(T[1/K])[1/K]');
model.material('mat3').propertyGroup('def').set('thermalconductivity', 'k_solid_1(T[1/K])[W/(m*K)]');
model.material('mat3').propertyGroup('def').set('resistivity', 'res_solid_1(T[1/K])[ohm*m]');
model.material('mat3').propertyGroup('def').set('thermalexpansioncoefficient', '(alpha(T[1/K])[1/K]+(Tempref-293[K])*if(abs(T-Tempref)>1e-3,(alpha(T[1/K])[1/K]-alpha(Tempref[1/K])[1/K])/(T-Tempref),d(alpha(T[1/K])[1/K],T)))/(1+alpha(Tempref[1/K])[1/K]*(Tempref-293[K]))');
model.material('mat3').propertyGroup('def').set('heatcapacity', 'C_solid_1(T[1/K])[J/(kg*K)]');
model.material('mat3').propertyGroup('def').set('HC', 'HC_solid_1(T[1/K])[J/(mol*K)]');
model.material('mat3').propertyGroup('def').set('electricconductivity', 'sigma_solid_1(T[1/K])[S/m]');
model.material('mat3').propertyGroup('def').set('density', 'rho(T[1/K])[kg/m^3]');
model.material('mat3').propertyGroup('def').set('VP', 'VP_solid_1(T[1/K])[Pa]');
model.material('mat3').propertyGroup('def').func.create('dL', 'Piecewise');
model.material('mat3').propertyGroup('def').func('dL').set('funcname', 'dL');
model.material('mat3').propertyGroup('def').func('dL').set('arg', 'T');
model.material('mat3').propertyGroup('def').func('dL').set('extrap', 'constant');
model.material('mat3').propertyGroup('def').func('dL').set('pieces', {'0.0' '10.0' '-0.004134001';  ...
'10.0' '30.0' '-0.00415083+2.566303E-6*T^1-1.154799E-7*T^2+2.71357E-9*T^3';  ...
'30.0' '87.0' '-0.004065065-6.856586E-6*T^1+2.120401E-7*T^2-9.814541E-10*T^3+2.367498E-12*T^4-2.275841E-15*T^5';  ...
'87.0' '873.0' '-0.004745213+1.182195E-5*T^1+1.97186E-8*T^2-1.837579E-11*T^3+6.889976E-15*T^4'});
model.material('mat3').propertyGroup('def').func.create('CTE', 'Piecewise');
model.material('mat3').propertyGroup('def').func('CTE').set('funcname', 'CTE');
model.material('mat3').propertyGroup('def').func('CTE').set('arg', 'T');
model.material('mat3').propertyGroup('def').func('CTE').set('extrap', 'constant');
model.material('mat3').propertyGroup('def').func('CTE').set('pieces', {'30.0' '300.0' '-8.786433E-6+5.111237E-7*T^1-4.275991E-9*T^2+1.8602E-11*T^3-4.019836E-14*T^4+3.403595E-17*T^5'});
model.material('mat3').propertyGroup('def').func.create('k_solid_1', 'Piecewise');
model.material('mat3').propertyGroup('def').func('k_solid_1').set('funcname', 'k_solid_1');
model.material('mat3').propertyGroup('def').func('k_solid_1').set('arg', 'T');
model.material('mat3').propertyGroup('def').func('k_solid_1').set('extrap', 'constant');
model.material('mat3').propertyGroup('def').func('k_solid_1').set('pieces', {'0.0' '12.0' '3587.152*T^1+348.8866*T^2-101.463*T^3+5.370411*T^4-0.06180556*T^5';  ...
'12.0' '35.0' '50522.05-4753.283*T^1+172.2387*T^2-2.689213*T^3+0.01433909*T^4';  ...
'35.0' '100.0' '10048.41-524.6271*T^1+11.6041*T^2-0.1287378*T^3+7.123183E-4*T^4-1.566974E-6*T^5';  ...
'100.0' '250.0' '759.2297-7.120703*T^1+0.06197118*T^2-2.715928E-4*T^3+6.016276E-7*T^4-5.424229E-10*T^5';  ...
'250.0' '1235.0' '419.8682+0.09979317*T^1-2.937158E-4*T^2+2.109166E-7*T^3-5.786644E-11*T^4'});
model.material('mat3').propertyGroup('def').func.create('res_solid_1', 'Piecewise');
model.material('mat3').propertyGroup('def').func('res_solid_1').set('funcname', 'res_solid_1');
model.material('mat3').propertyGroup('def').func('res_solid_1').set('arg', 'T');
model.material('mat3').propertyGroup('def').func('res_solid_1').set('extrap', 'constant');
model.material('mat3').propertyGroup('def').func('res_solid_1').set('pieces', {'1.0' '15.8' '9.822048E-12+2.259567E-13*T^1-6.690094E-14*T^2+6.144183E-15*T^3';  ...
'15.8' '27.5' '-2.33E-11+7.473333E-12*T^1-6.16E-13*T^2+2.026667E-14*T^3';  ...
'27.5' '60.0' '8.015476E-10-7.586429E-11*T^1+2.210952E-12*T^2-1.2E-14*T^3';  ...
'60.0' '200.0' '-2.428741E-9+6.974508E-11*T^1-4.447028E-14*T^2+6.841184E-17*T^3';  ...
'200.0' '1235.0' '-1.812752E-9+6.074742E-11*T^1-3.077059E-15*T^2+8.269045E-18*T^3'});
model.material('mat3').propertyGroup('def').func.create('alpha', 'Piecewise');
model.material('mat3').propertyGroup('def').func('alpha').set('funcname', 'alpha');
model.material('mat3').propertyGroup('def').func('alpha').set('arg', 'T');
model.material('mat3').propertyGroup('def').func('alpha').set('extrap', 'constant');
model.material('mat3').propertyGroup('def').func('alpha').set('pieces', {'0.0' '92.0' '1.397008E-5+6.293815E-8*T^1-3.772802E-10*T^2+1.128415E-12*T^3-1.223488E-15*T^4'; '92.0' '873.0' '1.604749E-5+1.576798E-8*T^1-1.719191E-11*T^2+6.931419E-15*T^3'});
model.material('mat3').propertyGroup('def').func.create('C_solid_1', 'Piecewise');
model.material('mat3').propertyGroup('def').func('C_solid_1').set('funcname', 'C_solid_1');
model.material('mat3').propertyGroup('def').func('C_solid_1').set('arg', 'T');
model.material('mat3').propertyGroup('def').func('C_solid_1').set('extrap', 'constant');
model.material('mat3').propertyGroup('def').func('C_solid_1').set('pieces', {'1.0' '12.3' '0.01224227-0.01394369*T^1+0.01009593*T^2-4.957659E-4*T^3+1.66168E-4*T^4-3.512349E-6*T^5';  ...
'12.3' '75.0' '24.24847-4.669813*T^1+0.2956444*T^2-0.004853545*T^3+3.380225E-5*T^4-8.439015E-8*T^5';  ...
'75.0' '300.0' '-63.85884+5.177265*T^1-0.03961478*T^2+1.570454E-4*T^3-3.105375E-7*T^4+2.411435E-10*T^5';  ...
'300.0' '1235.0' '225.7065+0.01705702*T^1+5.007143E-5*T^2-1.768498E-8*T^3'});
model.material('mat3').propertyGroup('def').func.create('HC_solid_1', 'Piecewise');
model.material('mat3').propertyGroup('def').func('HC_solid_1').set('funcname', 'HC_solid_1');
model.material('mat3').propertyGroup('def').func('HC_solid_1').set('arg', 'T');
model.material('mat3').propertyGroup('def').func('HC_solid_1').set('extrap', 'constant');
model.material('mat3').propertyGroup('def').func('HC_solid_1').set('pieces', {'1.0' '12.3' '0.001320549-0.001504078*T^1+0.001089028*T^2-5.347725E-5*T^3+1.792421E-5*T^4-3.788701E-7*T^5';  ...
'12.3' '75.0' '2.615634-0.5037235*T^1+0.03189057*T^2-5.235422E-4*T^3+3.646182E-6*T^4-9.102999E-9*T^5';  ...
'75.0' '300.0' '-6.888324+0.5584615*T^1-0.004273165*T^2+1.694017E-5*T^3-3.349706E-8*T^4+2.601167E-11*T^5';  ...
'300.0' '1235.0' '24.34652+0.001839907*T^1+5.401105E-6*T^2-1.907643E-9*T^3'});
model.material('mat3').propertyGroup('def').func.create('sigma_solid_1', 'Piecewise');
model.material('mat3').propertyGroup('def').func('sigma_solid_1').set('funcname', 'sigma_solid_1');
model.material('mat3').propertyGroup('def').func('sigma_solid_1').set('arg', 'T');
model.material('mat3').propertyGroup('def').func('sigma_solid_1').set('extrap', 'constant');
model.material('mat3').propertyGroup('def').func('sigma_solid_1').set('pieces', {'1.0' '15.8' '1/(6.144183E-15*T^3-6.690094E-14*T^2+2.259567E-13*T+9.822048E-12)';  ...
'15.8' '27.5' '1/(2.026667E-14*T^3-6.160000E-13*T^2+7.473333E-12*T-2.330000E-11)';  ...
'27.5' '60.0' '1/(-1.200000E-14*T^3+2.210952E-12*T^2-7.586429E-11*T+8.015476E-10)';  ...
'60.0' '200.0' '1/(6.841184E-17*T^3-4.447028E-14*T^2+6.974508E-11*T-2.428741E-09)';  ...
'200.0' '1235.0' '1/(8.269045E-18*T^3-3.077059E-15*T^2+6.074742E-11*T-1.812752E-09)'});
model.material('mat3').propertyGroup('def').func.create('rho', 'Piecewise');
model.material('mat3').propertyGroup('def').func('rho').set('funcname', 'rho');
model.material('mat3').propertyGroup('def').func('rho').set('arg', 'T');
model.material('mat3').propertyGroup('def').func('rho').set('extrap', 'constant');
model.material('mat3').propertyGroup('def').func('rho').set('pieces', {'0.0' '30.0' '10630.38'; '30.0' '140.0' '10630.25+0.1394367*T^1-0.0048655*T^2+1.188653E-5*T^3'; '140.0' '873.0' '10658.96-0.4692536*T^1-2.976784E-4*T^2+1.470941E-7*T^3'});
model.material('mat3').propertyGroup('def').func.create('VP_solid_1', 'Piecewise');
model.material('mat3').propertyGroup('def').func('VP_solid_1').set('funcname', 'VP_solid_1');
model.material('mat3').propertyGroup('def').func('VP_solid_1').set('arg', 'T');
model.material('mat3').propertyGroup('def').func('VP_solid_1').set('extrap', 'constant');
model.material('mat3').propertyGroup('def').func('VP_solid_1').set('pieces', {'293.0' '1235.0' '(exp((-1.499900e+004/T-7.845000e-001*log10(T)+1.200781e+001)*log(10.0)))*1.333200e+002'});
model.material('mat3').propertyGroup('def').addInput('temperature');
model.material('mat3').propertyGroup('def').addInput('strainreferencetemperature');
model.material('mat3').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
model.material('mat3').propertyGroup('Enu').set('youngsmodulus', 'E(T[1/K])[Pa]');
model.material('mat3').propertyGroup('Enu').set('poissonsratio', 'nu(T[1/K])');
model.material('mat3').propertyGroup('Enu').func.create('E', 'Piecewise');
model.material('mat3').propertyGroup('Enu').func('E').set('funcname', 'E');
model.material('mat3').propertyGroup('Enu').func('E').set('arg', 'T');
model.material('mat3').propertyGroup('Enu').func('E').set('extrap', 'constant');
model.material('mat3').propertyGroup('Enu').func('E').set('pieces', {'0.0' '1173.0' '9.143965E10-2.775728E7*T^1-38123.31*T^2+49.99535*T^3-0.02009828*T^4'});
model.material('mat3').propertyGroup('Enu').func.create('nu', 'Piecewise');
model.material('mat3').propertyGroup('Enu').func('nu').set('funcname', 'nu');
model.material('mat3').propertyGroup('Enu').func('nu').set('arg', 'T');
model.material('mat3').propertyGroup('Enu').func('nu').set('extrap', 'constant');
model.material('mat3').propertyGroup('Enu').func('nu').set('pieces', {'0.0' '1173.0' '0.360203+1.499369E-5*T^1+4.008534E-8*T^2-1.475466E-11*T^3-1.181682E-15*T^4'});
model.material('mat3').propertyGroup('Enu').addInput('temperature');
model.material('mat3').propertyGroup.create('KG', 'Bulk modulus and shear modulus');
model.material('mat3').propertyGroup('KG').set('G', 'mu(T[1/K])[Pa]');
model.material('mat3').propertyGroup('KG').set('K', 'kappa(T[1/K])[Pa]');
model.material('mat3').propertyGroup('KG').func.create('mu', 'Piecewise');
model.material('mat3').propertyGroup('KG').func('mu').set('funcname', 'mu');
model.material('mat3').propertyGroup('KG').func('mu').set('arg', 'T');
model.material('mat3').propertyGroup('KG').func('mu').set('extrap', 'constant');
model.material('mat3').propertyGroup('KG').func('mu').set('pieces', {'0.0' '1173.0' '3.362582E10-6732560.0*T^1-31364.68*T^2+40.77008*T^3-0.01638472*T^4'});
model.material('mat3').propertyGroup('KG').func.create('kappa', 'Piecewise');
model.material('mat3').propertyGroup('KG').func('kappa').set('funcname', 'kappa');
model.material('mat3').propertyGroup('KG').func('kappa').set('arg', 'T');
model.material('mat3').propertyGroup('KG').func('kappa').set('extrap', 'constant');
model.material('mat3').propertyGroup('KG').func('kappa').set('pieces', {'0.0' '1173.0' '1.088261E11-3077357.0*T^1-87636.32*T^2+131.2545*T^3-0.05742809*T^4'});
model.material('mat3').propertyGroup('KG').addInput('temperature');
model.material('mat3').set('family', 'custom');
model.material('mat3').set('lighting', 'cooktorrance');
model.material('mat3').set('specular', 'custom');
model.material('mat3').set('customspecular', [0.7843137254901961 1 1]);
model.material('mat3').set('fresnel', 0.9);
model.material('mat3').set('roughness', 0.1);
model.material('mat3').set('shininess', 200);
model.material('mat3').selection.set([6]);
model.material('mat3').propertyGroup('def').set('relpermeability', {'1'});
model.material('mat3').propertyGroup('def').set('relpermittivity', {'21.3+j*0.693'});

model.physics('emw').feature.create('lco1', 'LineCurrentOutOfPlane', 0);
model.physics('emw').feature('lco1').selection.set([12]);
model.physics('emw').feature('lco1').set('Iop', '1');
model.physics('emw').feature.create('ffd1', 'FarFieldDomain', 2);
model.physics('emw').feature('ffd1').selection.set([1 2 3 4 5 8 9 10]);
model.physics('emw').prop('MeshControl').set('EnableMeshControl', true);
model.physics('emw').prop('MeshControl').set('SizeControlParameter', 'UserDefined');
model.physics('emw').prop('MeshControl').set('PhysicsControlledMeshMaximumElementSize', 'wl/5');
model.physics('emw').prop('MeshControl').set('ResolveWaveInLossyMedia', false);

model.mesh('mesh1').run;

model.sol.create('sol1');
model.sol('sol1').study('std1');

model.study('std1').feature('freq').set('notlistsolnum', 1);
model.study('std1').feature('freq').set('notsolnum', '1');
model.study('std1').feature('freq').set('listsolnum', 1);
model.study('std1').feature('freq').set('solnum', '1');

model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'freq');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'freq');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').feature.remove('pDef');
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {''});
model.sol('sol1').feature('s1').feature('p1').set('punit', {'Hz'});
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'auto');
model.sol('sol1').feature('s1').feature('p1').set('plot', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plotgroup', 'Default');
model.sol('sol1').feature('s1').feature('p1').set('probesel', 'all');
model.sol('sol1').feature('s1').feature('p1').set('probes', {});
model.sol('sol1').feature('s1').feature('p1').set('control', 'freq');
model.sol('sol1').feature('s1').set('control', 'freq');
model.sol('sol1').feature('s1').feature('aDef').set('complexfun', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.result.create('pg1', 'PlotGroup2D');
model.result('pg1').label('Electric Field (emw)');
model.result('pg1').set('oldanalysistype', 'noneavailable');
model.result('pg1').set('frametype', 'spatial');
model.result('pg1').set('data', 'dset1');
model.result('pg1').feature.create('surf1', 'Surface');
model.result('pg1').feature('surf1').set('oldanalysistype', 'noneavailable');
model.result('pg1').feature('surf1').set('data', 'parent');
model.result.create('pg2', 'PolarGroup');
model.result('pg2').label('2D Far Field (emw)');
model.result('pg2').set('data', 'dset1');
model.result('pg2').create('ff1', 'FarField');
model.result('pg2').feature('ff1').set('legend', 'on');
model.result.remove('pg2');
model.result.remove('pg1');

model.study('std1').feature('freq').set('showdistribute', false);
model.study('std1').feature('freq').set('plist', 'c/wk');

model.sol('sol1').feature.remove('st1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('s1');

model.study('std1').feature('freq').set('plist', 'c/wl');

model.sol('sol1').study('std1');

model.study('std1').feature('freq').set('notlistsolnum', 1);
model.study('std1').feature('freq').set('notsolnum', '1');
model.study('std1').feature('freq').set('listsolnum', 1);
model.study('std1').feature('freq').set('solnum', '1');

model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'freq');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'freq');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').feature.remove('pDef');
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'c/wl'});
model.sol('sol1').feature('s1').feature('p1').set('punit', {'Hz'});
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'auto');
model.sol('sol1').feature('s1').feature('p1').set('plot', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plotgroup', 'Default');
model.sol('sol1').feature('s1').feature('p1').set('probesel', 'all');
model.sol('sol1').feature('s1').feature('p1').set('probes', {});
model.sol('sol1').feature('s1').feature('p1').set('control', 'freq');
model.sol('sol1').feature('s1').set('control', 'freq');
model.sol('sol1').feature('s1').feature('aDef').set('complexfun', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.result.create('pg1', 'PlotGroup2D');
model.result('pg1').label('Electric Field (emw)');
model.result('pg1').set('oldanalysistype', 'noneavailable');
model.result('pg1').set('solvertype', 'none');
model.result('pg1').set('showlooplevel', {'off' 'off' 'off'});
model.result('pg1').set('frametype', 'spatial');
model.result('pg1').set('data', 'dset1');
model.result('pg1').feature.create('surf1', 'Surface');
model.result('pg1').feature('surf1').set('oldanalysistype', 'noneavailable');
model.result('pg1').feature('surf1').set('solvertype', 'none');
model.result('pg1').feature('surf1').set('data', 'parent');
model.result.create('pg2', 'PolarGroup');
model.result('pg2').label('2D Far Field (emw)');
model.result('pg2').set('data', 'dset1');
model.result('pg2').create('ff1', 'FarField');
model.result('pg2').feature('ff1').set('legend', 'on');
model.result.remove('pg2');
model.result.remove('pg1');

model.material('mat2').propertyGroup('def').set('relpermittivity', {'2.14'});

model.sol('sol1').study('std1');

model.study('std1').feature('freq').set('notlistsolnum', 1);
model.study('std1').feature('freq').set('notsolnum', '1');
model.study('std1').feature('freq').set('listsolnum', 1);
model.study('std1').feature('freq').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'freq');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'freq');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').feature.remove('pDef');
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'c/wl'});
model.sol('sol1').feature('s1').feature('p1').set('punit', {'Hz'});
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'auto');
model.sol('sol1').feature('s1').feature('p1').set('plot', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plotgroup', 'Default');
model.sol('sol1').feature('s1').feature('p1').set('probesel', 'all');
model.sol('sol1').feature('s1').feature('p1').set('probes', {});
model.sol('sol1').feature('s1').feature('p1').set('control', 'freq');
model.sol('sol1').feature('s1').set('control', 'freq');
model.sol('sol1').feature('s1').feature('aDef').set('complexfun', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.result.create('pg1', 'PlotGroup2D');
model.result('pg1').label('Electric Field (emw)');
model.result('pg1').set('oldanalysistype', 'noneavailable');
model.result('pg1').set('solvertype', 'none');
model.result('pg1').set('showlooplevel', {'off' 'off' 'off'});
model.result('pg1').set('frametype', 'spatial');
model.result('pg1').set('data', 'dset1');
model.result('pg1').feature.create('surf1', 'Surface');
model.result('pg1').feature('surf1').set('oldanalysistype', 'noneavailable');
model.result('pg1').feature('surf1').set('solvertype', 'none');
model.result('pg1').feature('surf1').set('data', 'parent');
model.result.create('pg2', 'PolarGroup');
model.result('pg2').label('2D Far Field (emw)');
model.result('pg2').set('data', 'dset1');
model.result('pg2').create('ff1', 'FarField');
model.result('pg2').feature('ff1').set('legend', 'on');
model.result.remove('pg2');
model.result.remove('pg1');

model.material('mat1').selection.set([1 2 3 4 5 8 9 10]);

model.sol('sol1').study('std1');

model.study('std1').feature('freq').set('notlistsolnum', 1);
model.study('std1').feature('freq').set('notsolnum', '1');
model.study('std1').feature('freq').set('listsolnum', 1);
model.study('std1').feature('freq').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'freq');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'freq');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').feature.remove('pDef');
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'c/wl'});
model.sol('sol1').feature('s1').feature('p1').set('punit', {'Hz'});
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'auto');
model.sol('sol1').feature('s1').feature('p1').set('plot', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plotgroup', 'Default');
model.sol('sol1').feature('s1').feature('p1').set('probesel', 'all');
model.sol('sol1').feature('s1').feature('p1').set('probes', {});
model.sol('sol1').feature('s1').feature('p1').set('control', 'freq');
model.sol('sol1').feature('s1').set('control', 'freq');
model.sol('sol1').feature('s1').feature('aDef').set('complexfun', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.result.create('pg1', 'PlotGroup2D');
model.result('pg1').label('Electric Field (emw)');
model.result('pg1').set('oldanalysistype', 'noneavailable');
model.result('pg1').set('solvertype', 'none');
model.result('pg1').set('showlooplevel', {'off' 'off' 'off'});
model.result('pg1').set('frametype', 'spatial');
model.result('pg1').set('data', 'dset1');
model.result('pg1').feature.create('surf1', 'Surface');
model.result('pg1').feature('surf1').set('oldanalysistype', 'noneavailable');
model.result('pg1').feature('surf1').set('solvertype', 'none');
model.result('pg1').feature('surf1').set('data', 'parent');
model.result.create('pg2', 'PolarGroup');
model.result('pg2').label('2D Far Field (emw)');
model.result('pg2').set('data', 'dset1');
model.result('pg2').create('ff1', 'FarField');
model.result('pg2').feature('ff1').set('legend', 'on');

model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg2').run;

model.physics('emw').feature.create('sctr1', 'Scattering', 1);
model.physics('emw').feature('sctr1').selection.set([1 2 3 5 10 27 30 31]);

model.study('std1').feature('freq').set('showdistribute', false);

model.sol('sol1').study('std1');

model.study('std1').feature('freq').set('notlistsolnum', 1);
model.study('std1').feature('freq').set('notsolnum', '1');
model.study('std1').feature('freq').set('listsolnum', 1);
model.study('std1').feature('freq').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'freq');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'freq');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').feature.remove('pDef');
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'c/wl'});
model.sol('sol1').feature('s1').feature('p1').set('punit', {'Hz'});
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'auto');
model.sol('sol1').feature('s1').feature('p1').set('plot', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plotgroup', 'pg1');
model.sol('sol1').feature('s1').feature('p1').set('probesel', 'all');
model.sol('sol1').feature('s1').feature('p1').set('probes', {});
model.sol('sol1').feature('s1').feature('p1').set('control', 'freq');
model.sol('sol1').feature('s1').set('control', 'freq');
model.sol('sol1').feature('s1').feature('aDef').set('complexfun', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg2').run;

model.study('std1').create('param', 'Parametric');
model.study('std1').feature('param').set('showdistribute', false);
model.study('std1').feature('param').setIndex('pname', 'ant_d', 0);
model.study('std1').feature('param').setIndex('plistarr', '', 0);
model.study('std1').feature('param').setIndex('punit', '', 0);
model.study('std1').feature('param').setIndex('pname', 'ant_d', 0);
model.study('std1').feature('param').setIndex('plistarr', '', 0);
model.study('std1').feature('param').setIndex('punit', '', 0);
model.study('std1').feature('param').setIndex('pname', 'emm_height', 0);
model.study('std1').feature('param').setIndex('plistarr', 'range(0.1*L_wd,(0.9*L_wd-(0.1*L_wd))/8,0.9*L_wd)', 0);
model.study('std1').feature('param').set('plot', 'on');
model.study('std1').feature('param').set('plotgroup', 'pg2');

model.param.set('emm', '0.6');
model.param.set('emm_height', 'emm*L_wg');

model.study('std1').feature('param').set('showdistribute', false);
model.study('std1').feature('param').setIndex('pname', 'emm', 0);
model.study('std1').feature('param').setIndex('plistarr', 'range(0.1*L_wd,(0.9*L_wd-(0.1*L_wd))/8,0.9*L_wd) range(0.1,0.1,0.9)', 0);
model.study('std1').feature('param').setIndex('plistarr', 'range(0.1*L_wd,(0.9*L_wd-(0.1*L_wd))/8,0.9*L_wd) range(0.1,0.1,0.9) range(0.1,0.1,0.9)', 0);
model.study('std1').feature('param').setIndex('plistarr', 'range(0.1,0.1,0.9)', 0);

model.sol('sol1').study('std1');

model.study('std1').feature('freq').set('notlistsolnum', 1);
model.study('std1').feature('freq').set('notsolnum', '1');
model.study('std1').feature('freq').set('listsolnum', 1);
model.study('std1').feature('freq').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'freq');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'freq');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').feature.remove('pDef');
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'c/wl'});
model.sol('sol1').feature('s1').feature('p1').set('punit', {'Hz'});
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'auto');
model.sol('sol1').feature('s1').feature('p1').set('plot', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plotgroup', 'pg1');
model.sol('sol1').feature('s1').feature('p1').set('probesel', 'all');
model.sol('sol1').feature('s1').feature('p1').set('probes', {});
model.sol('sol1').feature('s1').feature('p1').set('control', 'freq');
model.sol('sol1').feature('s1').set('control', 'freq');
model.sol('sol1').feature('s1').feature('aDef').set('complexfun', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.batch.create('p1', 'Parametric');
model.batch('p1').study('std1');
model.batch('p1').create('so1', 'Solutionseq');
model.batch('p1').feature('so1').set('seq', 'sol1');
model.batch('p1').feature('so1').set('store', 'on');
model.batch('p1').feature('so1').set('clear', 'on');
model.batch('p1').feature('so1').set('psol', 'none');
model.batch('p1').set('pname', {'emm'});
model.batch('p1').set('plistarr', {'range(0.1,0.1,0.9)'});
model.batch('p1').set('sweeptype', 'sparse');
model.batch('p1').set('probesel', 'all');
model.batch('p1').set('probes', {});
model.batch('p1').set('plot', 'on');
model.batch('p1').set('plotgroup', 'pg2');
model.batch('p1').set('err', 'on');
model.batch('p1').attach('std1');
model.batch('p1').set('control', 'param');

model.sol.create('sol2');
model.sol('sol2').study('std1');
model.sol('sol2').label('Parametric Solutions 1');

model.batch('p1').feature('so1').set('psol', 'sol2');

model.result.create('pg3', 'PlotGroup2D');
model.result('pg3').label('Electric Field (emw) 1');
model.result('pg3').set('data', 'dset2');
model.result('pg3').set('oldanalysistype', 'noneavailable');
model.result('pg3').set('frametype', 'spatial');
model.result('pg3').set('data', 'dset2');
model.result('pg3').feature.create('surf1', 'Surface');
model.result('pg3').feature('surf1').set('oldanalysistype', 'noneavailable');
model.result('pg3').feature('surf1').set('data', 'parent');
model.result.create('pg4', 'PolarGroup');
model.result('pg4').label('2D Far Field (emw) 1');
model.result('pg4').set('data', 'dset2');
model.result('pg4').create('ff1', 'FarField');
model.result('pg4').feature('ff1').set('legend', 'on');

model.batch('p1').run;

model.result('pg3').run;
model.result('pg3').setIndex('looplevel', '1', 1);
model.result('pg3').run;
model.result('pg2').run;
model.result('pg2').feature('ff1').set('data', 'dset2');
model.result('pg2').feature('ff1').setIndex('looplevelinput', 'first', 1);
model.result('pg2').run;
model.result('pg2').feature('ff1').setIndex('looplevelinput', 'all', 1);
model.result('pg2').run;
model.result.numerical.create('int1', 'IntLine');
model.result('pg4').run;
model.result('pg4').run;
model.result.numerical('int1').set('expr', 'emw.normEfar');
model.result.numerical('int1').set('method', 'auto');
model.result.numerical('int1').set('descractive', 'off');
model.result.numerical('int1').selection.set([19]);
model.result.table.create('tbl1', 'Table');
model.result.table('tbl1').comments('Line Integration 1 (emw.normEfar)');
model.result.numerical('int1').set('table', 'tbl1');
model.result.numerical('int1').setResult;
model.result.export.create('data1', 'Data');
model.result.export('data1').set('filename', 'C:\Users\Hamza\Documents\Untitled.dat');
model.result.export('data1').run;
model.result('pg4').run;
model.result('pg4').run;

model.study('std1').feature('param').set('showdistribute', false);
model.study('std1').feature('param').setIndex('pname', 'L_wg', 0);
model.study('std1').feature('param').setIndex('plistarr', 'range(0.1,0.1,5)', 0);
model.study('std1').feature('param').setIndex('punit', 'um', 0);

model.sol('sol1').study('std1');

model.study('std1').feature('freq').set('notlistsolnum', 1);
model.study('std1').feature('freq').set('notsolnum', '1');
model.study('std1').feature('freq').set('listsolnum', 1);
model.study('std1').feature('freq').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'freq');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'freq');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').feature.remove('pDef');
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'c/wl'});
model.sol('sol1').feature('s1').feature('p1').set('punit', {'Hz'});
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'auto');
model.sol('sol1').feature('s1').feature('p1').set('plot', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plotgroup', 'pg1');
model.sol('sol1').feature('s1').feature('p1').set('probesel', 'all');
model.sol('sol1').feature('s1').feature('p1').set('probes', {});
model.sol('sol1').feature('s1').feature('p1').set('control', 'freq');
model.sol('sol1').feature('s1').set('control', 'freq');
model.sol('sol1').feature('s1').feature('aDef').set('complexfun', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.batch('p1').feature.remove('so1');
model.batch('p1').create('so1', 'Solutionseq');
model.batch('p1').feature('so1').set('seq', 'sol1');
model.batch('p1').feature('so1').set('store', 'on');
model.batch('p1').feature('so1').set('clear', 'on');
model.batch('p1').feature('so1').set('psol', 'sol2');
model.batch('p1').set('pname', {'L_wg'});
model.batch('p1').set('plistarr', {'range(0.1,0.1,5)'});
model.batch('p1').set('sweeptype', 'sparse');
model.batch('p1').set('probesel', 'all');
model.batch('p1').set('probes', {});
model.batch('p1').set('plot', 'on');
model.batch('p1').set('plotgroup', 'pg2');
model.batch('p1').set('err', 'on');
model.batch('p1').attach('std1');
model.batch('p1').set('control', 'param');

model.study('std1').feature('param').setIndex('plistarr', 'range(0.1,1,5.1)', 0);

model.sol('sol1').study('std1');

model.study('std1').feature('freq').set('notlistsolnum', 1);
model.study('std1').feature('freq').set('notsolnum', '1');
model.study('std1').feature('freq').set('listsolnum', 1);
model.study('std1').feature('freq').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'freq');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'freq');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').feature.remove('pDef');
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'c/wl'});
model.sol('sol1').feature('s1').feature('p1').set('punit', {'Hz'});
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'auto');
model.sol('sol1').feature('s1').feature('p1').set('plot', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plotgroup', 'pg1');
model.sol('sol1').feature('s1').feature('p1').set('probesel', 'all');
model.sol('sol1').feature('s1').feature('p1').set('probes', {});
model.sol('sol1').feature('s1').feature('p1').set('control', 'freq');
model.sol('sol1').feature('s1').set('control', 'freq');
model.sol('sol1').feature('s1').feature('aDef').set('complexfun', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.batch('p1').feature.remove('so1');
model.batch('p1').create('so1', 'Solutionseq');
model.batch('p1').feature('so1').set('seq', 'sol1');
model.batch('p1').feature('so1').set('store', 'on');
model.batch('p1').feature('so1').set('clear', 'on');
model.batch('p1').feature('so1').set('psol', 'sol2');
model.batch('p1').set('pname', {'L_wg'});
model.batch('p1').set('plistarr', {'range(0.1,1,5.1)'});
model.batch('p1').set('sweeptype', 'sparse');
model.batch('p1').set('probesel', 'all');
model.batch('p1').set('probes', {});
model.batch('p1').set('plot', 'on');
model.batch('p1').set('plotgroup', 'pg2');
model.batch('p1').set('err', 'on');
model.batch('p1').attach('std1');
model.batch('p1').set('control', 'param');
model.batch('p1').run;

model.result('pg3').run;

model.geom('geom1').run;

model.mesh('mesh1').automatic(true);
model.mesh('mesh1').autoMeshSize(4);
model.mesh.remove('mesh1');
model.mesh.create('mesh1', 'geom1');
model.mesh('mesh1').run;

model.physics('emw').prop('MeshControl').set('EnableMeshControl', false);

model.mesh('mesh1').run;
model.mesh('mesh1').run;
model.mesh('mesh1').run;
model.mesh('mesh1').run;
model.mesh('mesh1').automatic(true);
model.mesh('mesh1').run;
model.mesh('mesh1').autoMeshSize(2);
model.mesh('mesh1').run;
model.mesh('mesh1').autoMeshSize(1);
model.mesh('mesh1').run;

model.study('std1').feature('param').set('showdistribute', false);
model.study('std1').feature.remove('param');

model.sol('sol1').study('std1');

model.study('std1').feature('freq').set('notlistsolnum', 1);
model.study('std1').feature('freq').set('notsolnum', '1');
model.study('std1').feature('freq').set('listsolnum', 1);
model.study('std1').feature('freq').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'freq');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'freq');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').feature.remove('pDef');
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'c/wl'});
model.sol('sol1').feature('s1').feature('p1').set('punit', {'Hz'});
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'auto');
model.sol('sol1').feature('s1').feature('p1').set('plot', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plotgroup', 'pg1');
model.sol('sol1').feature('s1').feature('p1').set('probesel', 'all');
model.sol('sol1').feature('s1').feature('p1').set('probes', {});
model.sol('sol1').feature('s1').feature('p1').set('control', 'freq');
model.sol('sol1').feature('s1').set('control', 'freq');
model.sol('sol1').feature('s1').feature('aDef').set('complexfun', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.batch.remove('p1');

model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg4').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg4').run;
model.result.numerical.remove('int1');

model.study('std1').feature('freq').set('showdistribute', false);

model.sol('sol1').study('std1');

model.study('std1').feature('freq').set('notlistsolnum', 1);
model.study('std1').feature('freq').set('notsolnum', '1');
model.study('std1').feature('freq').set('listsolnum', 1);
model.study('std1').feature('freq').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'freq');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'freq');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').feature.remove('pDef');
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'c/wl'});
model.sol('sol1').feature('s1').feature('p1').set('punit', {'Hz'});
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'auto');
model.sol('sol1').feature('s1').feature('p1').set('plot', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plotgroup', 'pg1');
model.sol('sol1').feature('s1').feature('p1').set('probesel', 'all');
model.sol('sol1').feature('s1').feature('p1').set('probes', {});
model.sol('sol1').feature('s1').feature('p1').set('control', 'freq');
model.sol('sol1').feature('s1').set('control', 'freq');
model.sol('sol1').feature('s1').feature('aDef').set('complexfun', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg3').run;
model.result('pg2').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').feature('ff1').set('data', 'dset1');
model.result('pg4').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').create('tblp1', 'Table');
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').feature('tblp1').set('imagplot', 'on');
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').create('nyq1', 'Nyquist');
model.result('pg2').feature.remove('nyq1');
model.result('pg2').run;
model.result('pg2').run;
model.result('pg4').run;
model.result('pg4').create('tblp1', 'Table');
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').feature.remove('tblp1');
model.result('pg4').run;
model.result.export.create('data2', 'Data');
model.result.export.remove('data2');
model.result.dataset.create('dset3', 'Solution');
model.result.dataset('dset3').run;

model.sol('sol1').clearSolution;
model.sol('sol2').clearSolution;
model.sol('sol3').clearSolution;
model.sol('sol4').clearSolution;
model.sol('sol5').clearSolution;
model.sol('sol6').clearSolution;
model.sol('sol7').clearSolution;
model.sol('sol8').clearSolution;
model.sol('sol1').study('std1');

model.study('std1').feature('freq').set('notlistsolnum', 1);
model.study('std1').feature('freq').set('notsolnum', '1');
model.study('std1').feature('freq').set('listsolnum', 1);
model.study('std1').feature('freq').set('solnum', '1');

model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'freq');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'freq');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').feature.remove('pDef');
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'c/wl'});
model.sol('sol1').feature('s1').feature('p1').set('punit', {'Hz'});
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'auto');
model.sol('sol1').feature('s1').feature('p1').set('plot', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plotgroup', 'pg1');
model.sol('sol1').feature('s1').feature('p1').set('probesel', 'all');
model.sol('sol1').feature('s1').feature('p1').set('probes', {});
model.sol('sol1').feature('s1').feature('p1').set('control', 'freq');
model.sol('sol1').feature('s1').set('control', 'freq');
model.sol('sol1').feature('s1').feature('aDef').set('complexfun', true);
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'dDef');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').run;
model.result('pg2').run;

model.mesh('mesh1').automatic(false);
model.mesh('mesh1').feature('size').set('custom', 'on');
model.mesh('mesh1').feature('size').set('hmax', 'wl/5');
model.mesh('mesh1').feature('ftri1').selection.geom('geom1', 2);
model.mesh('mesh1').feature('ftri1').selection.set([3 5 8 9]);
model.mesh('mesh1').create('size1', 'Size');
model.mesh('mesh1').feature('size1').selection.geom('geom1', 2);
model.mesh('mesh1').feature('size1').selection.set([6 7]);
model.mesh('mesh1').feature('size1').set('custom', 'on');
model.mesh('mesh1').feature('size1').set('hmaxactive', 'on');
model.mesh('mesh1').feature('size1').set('hmax', 'wl/10');
model.mesh('mesh1').feature('size1').set('hminactive', 'on');
model.mesh('mesh1').feature('size1').set('hgradactive', 'on');
model.mesh('mesh1').feature('size1').set('hcurveactive', 'on');
model.mesh('mesh1').feature('size1').set('hnarrowactive', 'on');
model.mesh('mesh1').run;
model.mesh('mesh1').feature.create('ftri2', 'FreeTri');
model.mesh('mesh1').feature('ftri2').selection.geom('geom1');
model.mesh('mesh1').feature('ftri2').selection.geom('geom1', 2);
model.mesh('mesh1').feature('ftri2').selection.set([6 7]);
model.mesh('mesh1').run('ftri2');
model.mesh('mesh1').feature.create('ftri3', 'FreeTri');
model.mesh('mesh1').feature.remove('ftri3');
model.mesh('mesh1').feature.create('bl1', 'BndLayer');
model.mesh('mesh1').feature('bl1').create('blp1', 'BndLayerProp');
model.mesh('mesh1').feature('bl1').selection.geom(2);
model.mesh('mesh1').feature('bl1').selection.set([]);
model.mesh('mesh1').feature('bl1').selection.allGeom;
model.mesh('mesh1').feature('bl1').selection.geom('geom1', 2);
model.mesh('mesh1').feature('bl1').selection.set([1 2 4 10]);
model.mesh('mesh1').run('bl1');
model.mesh('mesh1').feature('bl1').selection.set([1 2 4 10]);
model.mesh('mesh1').feature('bl1').set('splitangle', '0');
model.mesh('mesh1').feature('bl1').set('splitdivangle', '0');
model.mesh('mesh1').feature('bl1').set('splitangle', '180');
model.mesh('mesh1').feature('bl1').set('splitdivangle', '180');
model.mesh('mesh1').feature('bl1').set('splitangle', '360');
model.mesh('mesh1').feature('bl1').set('splitdivangle', '1');
model.mesh('mesh1').run('bl1');
model.mesh('mesh1').feature('bl1').selection.set([1 2 4 10]);
model.mesh('mesh1').feature('bl1').set('sharpcorners', 'none');
model.mesh('mesh1').run('bl1');
model.mesh('mesh1').feature.remove('bl1');
model.mesh('mesh1').feature.create('map1', 'Map');
model.mesh('mesh1').feature('map1').selection.geom('geom1', 2);
model.mesh('mesh1').feature('map1').selection.set([1 2 4 10]);
model.mesh('mesh1').run('map1');

model.label('dipole above flat metallic surface.mph');

model.material('mat2').active(false);

model.physics('emw').feature.remove('lco1');

model.material('mat3').propertyGroup('def').set('relpermittivity', {'-34.5+j*8.5'});

model.mesh('mesh1').run;

model.physics('emw').feature.create('epd1', 'ElectricPointDipole', 0);
model.physics('emw').feature('epd1').selection.set([12]);
model.physics('emw').feature('epd1').set('enpI', {'1' '0' '0'});

out = model;
