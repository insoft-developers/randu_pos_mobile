import 'dart:io';

const bool isDev = true;
const String versionCode = '2.3.1';
const endpointDev = 'https://dev.randu.co.id';
// const endpointDev = 'http://192.168.100.3/randu-api/public';

const endpointApp = 'https://app.randu.co.id';
const endpoint = isDev ? endpointDev : endpointApp;
const endpointApi = '$endpoint/api/v2';
const endpointStorage = '$endpointApp/storage/';
const int pinLength = 6;
const String versionApp = '$versionCode ${isDev ? '- Dev' : ''}';
String dateBuild = '25 April 2025';
const anonKey = String.fromEnvironment('ANON_KEY');
const String authBoxName = 'auth';
const String noImage =
    'https://dmlawyer.com/wp-content/uploads/2015/04/no_image_available.jpg';
const int limitPage = 4;

const savedTransactionBox = 'savedTransactionBox';
const categoriesData = 'categorriesBox';
const productsBox = 'productsBox';
const isCashierOpenData = 'isCashierOpenBox';
const isPettyCashEnabledData = 'isPettyCashEnabledBox';
const isOnlineData = 'isOnlineBox';
const paymentMethodsData = 'paymentMethodsBox';
const tableData = 'tableBox';
const String printerBox = 'printerBox';
const printerMultiData = 'printerMultiBox';
const printerModeBox = 'printerModeBox';

const String linkPlaystore =
    'https://play.google.com/store/apps/details?id=com.randu.pos';
const String linkAppstore =
    'https://apps.apple.com/us/app/randu-kasir-pos/id6698898106';
String linkStore = Platform.isAndroid ? linkPlaystore : linkAppstore;
const bool fakePrinters = false;
