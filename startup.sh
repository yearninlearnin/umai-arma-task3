#!/bin/bash
# Thanks to Remo - Enhanced with stylish background & beautiful woman

# Update and install Apache2
apt update
apt install -y apache2

# Start and enable Apache2
systemctl start apache2
systemctl enable apache2

# GCP Metadata server base URL and header
METADATA_URL="http://metadata.google.internal/computeMetadata/v1"
METADATA_FLAVOR_HEADER="Metadata-Flavor: Google"

# Use curl to fetch instance metadata
local_ipv4=$(curl -H "${METADATA_FLAVOR_HEADER}" -s "${METADATA_URL}/instance/network-interfaces/0/ip")
zone=$(curl -H "${METADATA_FLAVOR_HEADER}" -s "${METADATA_URL}/instance/zone")
project_id=$(curl -H "${METADATA_FLAVOR_HEADER}" -s "${METADATA_URL}/project/project-id")
network_tags=$(curl -H "${METADATA_FLAVOR_HEADER}" -s "${METADATA_URL}/instance/tags")

# Create elegant HTML page with beautiful woman and your custom text
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title> Task 3 ARMA</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@300;400;700&display=swap');
        
        body {
            margin: 0;
            padding: 0;
            font-family: 'Orbitron', monospace;
            background: 
                linear-gradient(135deg, rgba(0,0,0,0.4), rgba(0,255,65,0.1)), 
                url('https://images.unsplash.com/photo-1494790108755-2616c4a23804?ixlib=rb-4.0.3&auto=format&fit=crop&w=1887&q=80');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            color: white;
            min-height: 100vh;
            overflow-x: hidden;
        }
        
        /* Elegant floating particles effect */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: 
                radial-gradient(2px 2px at 20px 30px, rgba(0,255,65,0.3), transparent),
                radial-gradient(2px 2px at 40px 70px, rgba(255,255,255,0.2), transparent),
                radial-gradient(1px 1px at 90px 40px, rgba(0,255,65,0.4), transparent),
                radial-gradient(1px 1px at 130px 80px, rgba(255,255,255,0.3), transparent);
            background-repeat: repeat;
            background-size: 200px 200px;
            animation: float 20s infinite linear;
            pointer-events: none;
        }
        
        @keyframes float {
            0% { transform: translate(0px, 0px) rotate(0deg); }
            33% { transform: translate(30px, -30px) rotate(120deg); }
            66% { transform: translate(-20px, 20px) rotate(240deg); }
            100% { transform: translate(0px, 0px) rotate(360deg); }
        }
        
        .top-left {
            position: fixed;
            top: 20px;
            left: 20px;
            background: linear-gradient(135deg, rgba(0,0,0,0.9), rgba(0,40,0,0.8));
            padding: 25px;
            border-radius: 20px;
            border: 3px solid #00ff41;
            max-width: 420px;
            backdrop-filter: blur(15px);
            box-shadow: 
                0 8px 32px rgba(0, 255, 65, 0.3),
                inset 0 1px 0 rgba(255, 255, 255, 0.1);
            z-index: 1000;
        }
        
        .top-left h2 {
            margin-top: 0;
            color: #00ff41;
            text-shadow: 
                0 0 10px #00ff41,
                0 0 20px #00ff41,
                0 0 30px #00ff41;
            font-weight: 700;
            font-size: 1.4em;
        }
        
        .top-left h3 {
            color: #ffffff;
            margin: 15px 0;
            font-weight: 400;
            text-shadow: 0 2px 4px rgba(0,0,0,0.5);
        }
        
        .top-left p {
            margin: 10px 0;
            font-size: 14px;
            color: #e0e0e0;
            text-shadow: 0 1px 2px rgba(0,0,0,0.7);
        }
        
        .top-left b {
            color: #00ff41;
            text-shadow: 0 0 5px #00ff41;
        }
        
        .pulsing {
            animation: pulse 2s infinite;
        }
        
        @keyframes pulse {
            0% { 
                text-shadow: 
                    0 0 10px #00ff41,
                    0 0 20px #00ff41,
                    0 0 30px #00ff41;
            }
            50% { 
                text-shadow: 
                    0 0 20px #00ff41,
                    0 0 30px #00ff41,
                    0 0 40px #00ff41,
                    0 0 50px #00ff41;
            }
            100% { 
                text-shadow: 
                    0 0 10px #00ff41,
                    0 0 20px #00ff41,
                    0 0 30px #00ff41;
            }
        }
        
        .center-content {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            flex-direction: column;
            text-align: center;
            position: relative;
            z-index: 100;
        }
        
        .main-title {
            font-size: 3.5em;
            font-weight: 700;
            text-shadow: 
                2px 2px 10px rgba(0,0,0,0.8),
                0 0 20px rgba(0,255,65,0.5);
            margin-bottom: 30px;
            color: #fff;
            background: linear-gradient(45deg, #fff, #00ff41);
            background-clip: text;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: titleGlow 3s ease-in-out infinite alternate;
        }
        
        @keyframes titleGlow {
            from { filter: drop-shadow(0 0 20px rgba(0,255,65,0.5)); }
            to { filter: drop-shadow(0 0 30px rgba(0,255,65,0.8)); }
        }
        
        .tech-badge {
            display: inline-block;
            background: linear-gradient(45deg, rgba(0,255,65,0.2), rgba(0,255,65,0.4));
            color: #00ff41;
            padding: 12px 20px;
            border-radius: 25px;
            border: 2px solid #00ff41;
            margin: 10px 8px;
            font-weight: 500;
            font-size: 0.95em;
            text-shadow: 0 0 10px #00ff41;
            box-shadow: 
                0 4px 15px rgba(0,255,65,0.3),
                inset 0 1px 0 rgba(255,255,255,0.2);
            transition: all 0.3s ease;
            cursor: pointer;
        }
        
        .tech-badge:hover {
            transform: translateY(-5px);
            box-shadow: 
                0 8px 25px rgba(0,255,65,0.5),
                inset 0 1px 0 rgba(255,255,255,0.3);
        }
        
        /* Beautiful woman portrait in bottom right */
        .portrait {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 200px;
            height: 280px;
            background: url('https://images.unsplash.com/photo-1494790108755-2616c4a23804?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80') center/cover;
            border-radius: 20px;
            border: 3px solid #00ff41;
            box-shadow: 
                0 8px 32px rgba(0,255,65,0.4),
                inset 0 1px 0 rgba(255,255,255,0.2);
            opacity: 0.9;
            transition: all 0.3s ease;
        }
        
        .portrait:hover {
            opacity: 1;
            transform: scale(1.05);
            box-shadow: 
                0 12px 40px rgba(0,255,65,0.6),
                inset 0 1px 0 rgba(255,255,255,0.3);
        }
        
        /* Elegant overlay for portrait */
        .portrait::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 60px;
            background: linear-gradient(transparent, rgba(0,0,0,0.8));
            border-radius: 0 0 17px 17px;
        }
    </style>
</head>
<body>
    <div class="top-left">
        <h2 class="pulsing">No more waffles until 170K..</h2>
        <h3>This is a test for task 3 arma</h3>
        <p><b>Instance Name:</b> $(hostname -f)</p>
        <p><b>Instance Private IP:</b> $local_ipv4</p>
        <p><b>Zone:</b> $zone</p>
        <p><b>Project ID:</b> $project_id</p>
        <p><b>Network Tags:</b> $network_tags</p>
        <p><b>Status:</b> <span style="color: #00ff41;">ONLINE</span></p>
    </div>
    
    <div class="center-content">
        <h1 class="main-title">Chewbacca is watching!!Choose one</h1>
        <div>
            <span class="tech-badge">Lizo</span>        
            <span class="tech-badge">ASMR Christina V</span>
            <span class="tech-badge">Colombiana shorty</span>
        </div>
    </div>
    
    <!-- Beautiful European woman portrait -->
    <div class="portrait"></div>
</body>
</html>
EOF

# Fix the permissions typo and set proper permissions
chown -R www-www-data /var/www/html/
chmod 644 /var/www/html/index.html

# Restart Apache
systemctl restart apache2

echo "Elegant Apache server with beautiful woman and custom styling ready!"
