public class HelloWorld {
    public static String greet(String name) {
        return 'Hello, ' + name + '!';
    }
}
EOF && cat > salesforce-devops-lab/force-app/main/default/classes/HelloWorld.cls-meta.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<ApexClass xmlns="http://soap.sforce.com/2006/04/metadata">
    <apiVersion>65.0</apiVersion>
    <status>Active</status>
</ApexClass>
