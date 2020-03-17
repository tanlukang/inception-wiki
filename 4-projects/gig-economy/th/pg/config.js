const config = {
    isVersioning: true
};

if (config.isVersioning) {
    config.schema = 'titanhouse_gig_versioning';
} else {
    config.schema = 'titanhouse_gig';
}

module.exports = config;