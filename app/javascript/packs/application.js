import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css';

import "./plugins/flatpickr"

import { initMapbox } from './plugins/init_mapbox';

import { quiz } from "./plugins/quiz";

import 'select2/dist/css/select2.css';

import { initSelect2 } from './plugins/selecter';

initSelect2();

initMapbox();

quiz();


