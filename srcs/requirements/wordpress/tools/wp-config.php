<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv('DB_NAME') );

/** Database username */
define( 'DB_USER', getenv('DB_USER') );

/** Database password */
define( 'DB_PASSWORD', getenv('DB_PASSWORD') );

/** Database hostname */
define( 'DB_HOST', getenv('DB_HOST') );
/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );


/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '(wFgoPYY8+.NmF}=5VU-IpHXrxc]G#>4/9~|<Kf>DocW<aH|JJC}5sj[JZ!{*#vf');
    define('SECURE_AUTH_KEY',  '+{i*/0!h O$rWm+Ge3/+hpKuRP-GqDOd+[IKI>aT!yXT;5m6@7+Ej+5oo8q+w,C%');
    define('LOGGED_IN_KEY',    'V~6G|Az7~cz&2,.e-a+hk|ITI)D. 9.9j*T}@q)7~m`A`-`g3=8-o8N# b]CS4-a');
    define('NONCE_KEY',        'UN--a])h-*Iw+dPUb VG- U>-yOD)zx}G0[G||Rip4D,|YpG:|8 j3I$ Dy!Gdmc');
    define('AUTH_SALT',        '^T+wnv|J4r3/tzr77?_Jib^Nr/O:,1E-|`*y:5]}e*uwGsI$>;xn7>xlvBjdL+:|');
    define('SECURE_AUTH_SALT', '~hI*1&~CHxU..ywd/&+!:n^Z=7foCs%+=n/KY9b+EPHIj#QfWj_MK1D,N?>KJ-*$');
    define('LOGGED_IN_SALT',   '^]1Zq;!ZL-||ry[*DG}~]<H9#H$Su[oMzWp,H|B_/rPA!wWHuZz8-0(m 7!V. r&');
    define('NONCE_SALT',       '^mKOV0={?ev90`DXj/HPb?xn<)`6dA/aOPj~XOTpVeBv_?R~!M2<lfk:,)&Y1Z/A');
/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', true );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';