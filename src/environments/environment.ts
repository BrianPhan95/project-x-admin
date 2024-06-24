import { Environment } from '@abp/ng.core';

const baseUrl = 'http://localhost:4200';

export const environment = {
  production: false,
  application: {
    baseUrl,
    name: 'ProjectX',
    logoUrl: '',
  },
  oAuthConfig: {
    issuer: 'https://localhost:5001/',
    redirectUri: baseUrl,
    clientId: 'ProjectX_App',
    responseType: 'code',
    scope: 'offline_access ProjectX',
    requireHttps: true,
  },
  apis: {
    default: {
      url: 'https://localhost:5001',
      rootNamespace: 'ProjectX',
    },
  },
} as Environment;
