package sudopuzzle;
//import java.util.*;

public class sudokupuzzle{
	public static int[][] a=new int[9][9];
	public static int n=9;		
	public static int[][] solution=new int[9][9];			
	public static int dif=0;
	public static int sec=0;
	public static int min=0;
	public static int valid=1;
	public static int sol=1;
	public int tp(){
		return 1;
	}
	public int[][] generator(){
		for(int i=0;i<n;i++){
			for(int j=0;j<n;j++){
				a[i][j]=0;
			}
		}
		a[0][0]=1+(int)(Math.random()*9);
		a[8][8]=1+(int)(Math.random()*9);


		/*{{1+(int)(Math.random()*9),0,0,0,0,0,0,0,0},
					{0,0,0,0,0,0,0,0,0},
					{0,0,0,0,0,0,0,0,0},
					{0,0,0,0,0,0,0,0,0},
					{0,0,0,0,0,0,0,0,0},
					{0,0,0,0,0,0,0,0,0},
					{0,0,0,0,0,0,0,0,0},
					{0,0,0,0,0,0,0,0,0},
					{0,0,0,0,0,0,0,0,1+(int)(Math.random()*9)}};
		*/
		solver(a,n);
		for(int i=0;i<n;i++){
			for(int j=0;j<n;j++){
					solution[i][j]=a[i][j];
			}
		}	
/*		for(int i=0;i<n;i++){
			for(int j=0;j<n;j++){
				if(a[i][j]==0){
						System.out.print("_ ");
				}else{
					System.out.print(a[i][j]+" ");
				}
			}
			System.out.println("");
		}	
*/	
		//digging holes;
	//	int dif=0;	//difficulty 0==>easy; 1==> normal; 2==> difficult
		int holes=0;
		
		
		if(dif==0){holes=30+(int)(Math.random()*10);}
		else if(dif==1){holes=40+(int)(Math.random()*10);}
		else{holes=50+(int)(Math.random()*10);}

		for(int i=0;i<holes;i++){
			int x=(int)(Math.random()*9);
			int y=(int)(Math.random()*9);
			a[x][y]=a[x][y]+10;
		}

/*
		System.out.println("Printing holed sudoku");
		for(int i=0;i<n;i++){
			for(int j=0;j<n;j++){
				if(a[i][j]==0){
						System.out.print("_ ");
				}else{
					System.out.print(a[i][j]+" ");
				}
			}
			System.out.println("");
		}	
	*/
		return a;
	}

	
	public static boolean solver(int[][] a,int n){
		boolean empty=false;
		for(int i=0;i<n;i++){			//to find empty positions in sudoku puzzle
			for(int j=0;j<n;j++){		//to find empty positions in sudoku puzzle
				if(a[i][j]==0){			//to find empty position in sudoku puzzle
					empty=true;
					boolean flag=true;	
					int k;
					for(k=1;k<=n;k++){
						flag=true;			//flag matintains if the present k is fit for putting in the ith jth cell.

		//				System.out.print("i="+i+" j="+j+" k="+k);
						for(int x=0;x<n;x++){
							if(a[i][x]==k){flag=false;
								//System.out.println("false1 see a["+i+"]["+x+"]");
								break;
							}
							if(a[x][j]==k){
								flag=false;
								//System.out.println("false2 see a["+x+"]["+j+"]");
								break;
							}
						}

						if(flag==true){
							int blockrow=i/3;
							int blockcolumn=j/3;
							for(int x=(blockrow*3);x<((blockrow*3)+3);x++){
								for(int y=(blockcolumn*3);y<((blockcolumn*3)+3);y++){
									//System.out.println("x="+x+" y="+y+" a[x][y]="+a[x][y]);
									if(k==a[x][y]){
										flag=false; 
										//System.out.println("false3");
										break;
									}
								}
							}
						}			
						
						boolean tp=true;;
						if(k==n && flag==false){
							return false;
						}
						if(flag==true){
							a[i][j]=k;
							tp=solver(a,n);
							if(tp==true){break;}
							if(tp==false){a[i][j]=0;}
							empty=false;
						}	
						if(tp==false && k==n){
							return false;
						}
					}			
				}
			}
		}
		if(empty==true){
			return true;
		}
		return true;
	}	

	public void printQuestion(){
		System.out.println("Printing question!");
		for(int i=0;i<n;i++){
			for(int j=0;j<n;j++){
				System.out.println(a[i][j]+" ");
			}
			System.out.println("");
		}
	}

	public int[][] answer(){
		return solution;
	}
	
	public void printAnswer(){
		System.out.println("Printing question!");
		for(int i=0;i<n;i++){
			for(int j=0;j<n;j++){
				System.out.println(solution[i][j]+" ");
			}
			System.out.println("");
		}
	}
}