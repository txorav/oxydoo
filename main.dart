import "dart:convert";
import "dart:core";
import "dart:io";

import "letix.dart";

void main() async {
  print("""
------------------------------------------Oxydoo is here------------------------------------------                                                                                    
                                         .:-==+*****++==-..                                         
                                    ..-+***##########*******+-..                                    
                                 ..+#########***********######**=..                                 
                                -*#***#######################******-.                               
                              -####**####**-:..      ..:-***#########-                              
                            :#########*-.                  .-*#########:                            
                          .=########*.                        .*####*###=.                          
                         .+#######*                              *#####**=.                         
                        .*###****.. .**++**+*++       +++++++**. .:*##***#*.                        
                       .=**+****.    .*########=    .+***####*.    :#######=                        
                      .-*######.      .+*******#=.  +#######+.      .#######-                       
                      .*###*##-        .+########-.*#######+.        -######*.                      
                      :######*           -*#######*#######-           *######:                      
                      +***+**.           .:#####****###**..           :######=                      
                     .***####.             :####****##**:             .*####**                      
                     .######*.              .*##***###*.              .*######.                     
                     .######*.             .=##########*.             .######*                      
                      +######.            .+############*.            .######+                      
                      :######*           .*###############-           *######:                      
                      .*######-         :########:+########=.        -######*.                      
                      .=#######.       -##%%%%##: .*########=.      .#######-                       
                        +#######.    .+########-    *########*.    .**#####=                        
                        .*###****:. .#########-     .*#########...:%######*.                        
                         .+###%%%%*...........       ............*%%%%###+.                         
                          .=##%%%%##+.                        .*###%%#%%=.                          
                            :##########=.                  .=#%%%%#####:                            
                              =#######%%###-:..      ..:=#%%########%=                              
                                =##%%########%%%%%%%%%%%%%#%%%%%###-.                               
                                 ..+#####%%%%%%%%%%########%%%%#+..                                 
                                    ..-*#%%%%%%%%%%%%%%%%%##*-..                                    
                                         .:=++*##%%##*++=:.       
-------------------------------------------------------------------------------------------------- 
--------------------------------------------------------------------------------------------------                                                                                                                                     
""");
  print("Oxydoo Key Commands :\n" + "r Quick Refresh\n" + "h Hard Refresh\n");
  // for(int i =0;i < 10000; i++){
  //   runProcess("top", [""]);
  // }
  Letix letixMachine = Letix();
  List content = await letixMachine.letixEngine(File("conf.lex"));
  print(content[2][7]);
  String odooPath = content[2][content[2].lastIndexOf("ODOO_PATH") + 2];
  String venvPath = content[2][content[2].lastIndexOf("VENV_PATH") + 2];
  print(odooPath);
  print(venvPath);
  String command = """
cd $odooPath  & source $venvPath & python $odooPath/odoo-bin -c $odooPath/odoo.conf
""";

  var process = await Process.start(
    "bash",
    ["-c", command],
    runInShell: false,
    mode: ProcessStartMode.inheritStdio,
  );
  while (true) {
    var flag = stdin.readLineSync();
    print("you write this shit $flag");
    if (flag == "q") {
      print(Process.killPid(process.pid));
      print(process.pid);
    } else if (flag == "l" || await process.exitCode == null) {
      var process = await Process.start(
        "bash",
        ["-c", command],
        runInShell: true,
        mode: ProcessStartMode.inheritStdio,
      );
    }
  }
}
