#include "Mapeamento.h"

void Mapeamento::mapeamento(Controlador_robo *robo, Sensor_cor *sensor){

	robo->andar(30);
	status_atual = status::em_frente;
	sentido_navegacao = 1;

	while(true){

		if(delay > 10){
			//TODO
		}


		if(sensor->ler_cor_D() == Cor::branco && sensor->ler_cor_E() == Cor::branco)
			continue;

		else if(sensor->ler_cor_D() == Cor::fora || sensor->ler_cor_E() == Cor::fora){
			//TODO
		}

		else if(sensor->ler_cor_D() == Cor::nda || sensor->ler_cor_E() == Cor::nda){
			//TODO
		}

		else{
			if(sensor->ler_cor_D() == sensor->ler_cor_E()){
				interseccao = true;
				map = mapeamento_intersec(robo, sensor);
				if(!map) break;
			}
		}

	}

}

bool Mapeamento::mapeamento_intersec(Controlador_robo *robo, Sensor_cor *sensor) {
	arquivo = new Arquivos_mapeamento("intersec.txt");


	/*Fim da cidade*/
	//TODO
	if(sensor->ler_cor_D() == Cor::vermelho && sensor->ler_cor_E() == Cor::vermelho) {
		usleep(delay_f*100000);
		if(sensor->ler_cor_D() == Cor::azul && sensor->ler_cor_E() == Cor::azul){
			usleep(delay_f*100000);
			if(sensor->ler_cor_D() == Cor::verde && sensor->ler_cor_E() == Cor::verde){
				usleep(delay_f*100000);
				if(sensor->ler_cor_D() == Cor::branco && sensor->ler_cor_E() == Cor::branco){
					sentido_navegacao = -1;
					arquivo->arq_intersec(checkpoint_vermelho, checkpoint_verde, checkpoint_azul);
					return false;
				}
			}
		}
	}

	/*Primeira intersecção*/
	if(cor_atual == checkpoint::nda)
		cor_atual = sensor->ler_cor_D();



	/*Depois da primeira intersecção*/
	else{
		/*Dead-end*/
		if(sensor->ler_cor_D() == Cor::preto && sensor->ler_cor_E() == Cor::preto){
			robo->andar(-30);

			//Andar até chegar na última intersecção e mudar status_atual
			while(true){
				if(sensor->ler_cor_D() == cor_atual && sensor->ler_cor_E() == cor_atual){
					usleep(0.2*1000000);
					if (status_atual == status::em_frente) {
						status_atual = status::direita;
						virar_direita(sentido_navegacao);
						break;
					}
					else if(status_atual == status::direita){
						status_atual = status::esquerda;
						virar_esquerda(sentido_navegacao);
						break;
					}
				}

			}
		}

		/*Encontro de outra intersecção*/
		else{


			/* Se a proxima cor for a mesma da anterior
			 * não será necessario passar por todos os testes de caminho
			 */
			if (sensor->ler_cor_D() == sensor->ler_cor_E() && sensor->ler_cor_D() == cor_atual){
				if (!confirmacao_status){
					if(cor_atual == checkpoint::vermelho)
						checkpoint_vermelho = status_atual;
					else if(cor_atual == checkpoint::verde)
						checkpoint_verde = status_atual;
					else if (cor_atual == checkpoint::azul)
						checkpoint_azul = status_atual;

					confirmacao_status = true;

				}
				caminho_certo(robo, sensor);
			}


			if (sensor->ler_cor_D() == sensor->ler_cor_E()){
				if(cor_atual == checkpoint::vermelho)
					checkpoint_vermelho = status_atual;
				else if(cor_atual == checkpoint::verde)
					checkpoint_verde = status_atual;
				else if (cor_atual == checkpoint::azul)
					checkpoint_azul = status_atual;


				cor_atual = sensor->ler_cor_D();
				status_atual = status::em_frente;
				confirmacao_status = false;
			}
		}
	}

	it1++;
	interseccao = false;


	return true;
}


void Mapeamento::caminho_certo (Controlador_robo *robo,Sensor_cor *sensor){

	if (sensor->ler_cor_E() == Cor::vermelho && sensor->ler_cor_D() == Cor::vermelho){
		ajeita_quadrado(robo);
		if (checkpoint_vermelho == status::direita)
			virar_direita(sentido_navegacao);

		else if (checkpoint_vermelho == status::esquerda)
			virar_esquerda(sentido_navegacao);
	}

	else if (sensor->ler_cor_E() == Cor::verde && sensor->ler_cor_D() == Cor::verde){
		ajeita_quadrado(robo);
		if (checkpoint_verde == status::direita)
			virar_direita(sentido_navegacao);
		else if (checkpoint_verde == status::esquerda)
			virar_esquerda(sentido_navegacao);
	}

	else if (sensor->ler_cor_E() == Cor::azul && sensor->ler_cor_D() == Cor::azul){
		ajeita_quadrado(robo);
		if (checkpoint_azul == status::direita)
			virar_direita(sentido_navegacao);

		else if (checkpoint_azul == status::esquerda)
			virar_esquerda(sentido_navegacao);
	}
}



void Mapeamento::ajeita_quadrado(Controlador_robo *robo){
	posicao_inicial = robo->get_distancia();
	while(robo->get_distancia() < posicao_inicial+0.19);
	robo->parar();
}



bool Mapeamento::inicializar_threads_ultra(){
	mapeamento_bonecoD = thread(&Mapeamento::loop_mapeamento_bonecoD, this);
	mapeamento_bonecoD.detach();
	usleep(100000);

	mapeamento_bonecoE = thread(&Mapeamento::loop_mapeamento_bonecoE, this);
	mapeamento_bonecoE.detach();
	usleep(100000);

	return thread_rodando;
}


bool Mapeamento::finalizar_threads_ultra(){
	if(thread_rodando)
		thread_rodando = false;

	usleep(1000*100);
	return true;
}

void Mapeamento::loop_mapeamento_bonecoE(Controlador_robo *robo, Ultrassom_nxt *ultraE){
	//TODO salvar posição dos bonecos
	while(thread_rodando){
		if(!map) break;

		if(!interseccao){
			posicao_bonecos = 0;
			if(ultraE->le_centimetro() <= 5){
				posicao_bonecos = robo->get_distancia();
				(*it1).posicao_pre_e.push_back(posicao_bonecos);

			}
		}
		else{
			posicao_intersec = robo->get_distancia();
			(*it2).posicao_pos_e = (*it1).posicao_pre_e;
			(*it2).posicao_pos_e.reverse();
			it3 = (*it2).posicao_pos_e.begin();
			//TODO
		}
	}
}


void Mapeamento::loop_mapeamento_bonecoD(Controlador_robo *robo, Ultrassom_nxt *ultraD){
	//TODO salvar posição dos bonecos
	while(thread_rodando){
		if(!map) break;


		if(!interseccao){
			posicao_bonecos = 0;
			if(ultraD->le_centimetro() <= 5){
				posicao_bonecos = robo->get_distancia();
				(*it1).posicao_pre_d.push_back(posicao_bonecos);

			}
		}
		else{
			posicao_intersec = robo->get_distancia();
			(*it2).posicao_pos_d = (*it1).posicao_pre_d;
			it2++;
		}
	}


}
